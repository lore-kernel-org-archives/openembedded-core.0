Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1Sx4N9-0000XK-4P
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Aug 2012 01:00:03 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q72MmLM2008044
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 2 Aug 2012 15:48:21 -0700 (PDT)
Received: from e6410-2 (172.25.40.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Thu, 2 Aug 2012 15:48:20 -0700
Date: Thu, 2 Aug 2012 17:48:18 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120802174818.43aa2ad3@e6410-2>
In-Reply-To: <fe3056c0364345c518f66266a7f92c1116763156.1343937363.git.andrei@gherzan.ro>
References: <cover.1343937363.git.andrei@gherzan.ro>
	<fe3056c0364345c518f66266a7f92c1116763156.1343937363.git.andrei@gherzan.ro>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] pseudo: Use fxstatat64 in unlinkat
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Aug 2012 23:00:03 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Thu, 2 Aug 2012 23:00:44 +0300
Andrei Gherzan <andrei@gherzan.ro> wrote:

> This is done to avoid "Value too large for defined data type" error
> while trying to remove a file > 2GB.
> 
> [Yocto #2881]

I thought "hey, that should be easy" and looked at this for a bit. Then
looked more. Then ran tests. Then looked more. Then grovelled through
man pages. Then hit up a guy I know at Apple for a system internals
question. Then looked at it more.

This one is HARD. See, the underlying problem is that, back at the dawn
of time, someone thought 32 bits was a reasonable file size. We know
that to be wrong now, but what to do?

The BSDs just jumped to 64-bit off_t back around 4.4BSD, so all the
BSD-derived stuff is fine. Except, of course, that OS X now has a new
problem because they also need to convert to 64-bit *inodes*, which
creates a change in the shape of a structure. But even then, their
solution is basically that the system defaults to mapping stat() to the
new type, and struct stat to the new type, and if you want the old ones
you can mess with #defines.

And Linux basically does this, too, except that it's *not* the default.
And furthermore, it affects file size. So if you are building for
32-bit, and you haven't defined _FILE_OFFSET_BITS=64, 'struct stat' has
a 32-bit off_t, and stat() expects that.

And in fact, the way this really gets resolved is that, if you define
that, and you write stat(), your code ends up linked against stat64().

So the problem is: On systems where both stat and stat64 exist, we have
to make that distinction, and things which don't use stat64 have to
call a different wrapper (pseudo_client_op_plain). And on some other
systems, there's no such thing as stat64 in view at all, so we can't
refer to that portably.

In fact, pseudo never cares about the size of a file. And it appears
that stat(2) will in fact fill in the whole buffer, then return -1 with
errno set to EOVERFLOW. So we could in theory just discount an errno -1
accompanied by EOVERFLOW. Except there's no *specification* that stat
is returning a valid stat buf except a few members might be truncated
or corrupt.

So, looking again at:

#ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
        rc = real_lstat(path, &buf);
#else
        rc = real___fxstatat(_STAT_VER, dirfd, path, &buf,
                             AT_SYMLINK_NOFOLLOW);
#endif
        if (rc == -1) {
                return rc;
        }
        msg = pseudo_client_op_plain(OP_MAY_UNLINK, 0, -1, dirfd, path,
                                     &buf);

The issue here is that both need to use stat64, or neither can. And
that we don't really want to have stat64 references in the nominally
portable code.

I think probably the right solution is to use the PSEUDO_STATBUF logic
that's already in ports, and expand on it a bit. I'm messing with:

#if PSEUDO_STATBUF_64
extern pseudo_msg_t *pseudo_client_op_plain(pseudo_op_t op, int access,
int fd, int dirfd, const char *path, const struct stat *buf, ...);
#define base_lstat real_lstat64
#define base_fstat real_fstat64
#define base_stat real_stat64
#define base_fstatat(dirfd, path, buf, flags)
real___fxstatat64(_STAT_VER, dirfd, path, buf, flags)
#else
#define pseudo_client_op_plain pseudo_client_op
#define base_lstat real_lstat 
#define base_fstat real_fstat 
#define base_stat real_stat
#define base_fstatat(dirfd, path, buf, flags)
real___fxstatat(_STAT_VER, dirfd, path, buf, flags)
#endif

with the intent being that the unix/guts/*.c would switch to using
PSEUDO_STATBUF instead of struct stat, and then all the calls to
real_fstat => base_fstat; this allows us to just use pseudo_client_op
consistently for most of these. So far as I can tell, nothing in that
directory expects to pass a struct stat of any kind back to the user,
with the arguable exception of ftw() and nftw(), both of which are
only passing around pointers to functions which take pointers to struct
stat, so they don't care.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


