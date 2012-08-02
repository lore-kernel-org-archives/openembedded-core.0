Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1Sx3EK-0007aE-Hv
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 23:46:52 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q72LZ8XV006932
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 2 Aug 2012 14:35:09 -0700 (PDT)
Received: from e6410-2 (172.25.40.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Thu, 2 Aug 2012 14:35:09 -0700
Date: Thu, 2 Aug 2012 16:35:07 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20120802163507.2b8de099@e6410-2>
In-Reply-To: <1343938089.9756.98.camel@ted>
References: <cover.1343937363.git.andrei@gherzan.ro>
	<fe3056c0364345c518f66266a7f92c1116763156.1343937363.git.andrei@gherzan.ro>
	<1343938089.9756.98.camel@ted>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 02 Aug 2012 21:46:52 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Thu, 2 Aug 2012 21:08:09 +0100
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> Adding seebs to the cc since I suspect he may prefer to merge this
> upstream or he may have feedback?

Ooh, thanks. Yeah, we need to fix this in upstream, but the patch as
provided will likely cause Strange Experiences.

See, if you look at a bit more of unlinkat:

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

So, what's pseudo_client_op_plain? Well. On systems that don't
distinguish between stat64 and stat, it's just a #define for
pseudo_client_op. But on Linux, at least:

#define PSEUDO_STATBUF_64 1
#define PSEUDO_STATBUF struct stat64

And then pseudo_client_op_plain does:

                pseudo_stat64_from32(&buf64, buf);
                return pseudo_client_op(op, access, fd, dirfd, path,
                                        &buf64, oldpath); 

So unless it happens that the 'struct stat' and 'struct stat64'
structures have the same layout, this is going to end badly.
We need a more comprehensive fix. But the unlinkat() code is in
the unix port, which tries not to rely on the knowledge that it
can rely on a stat64 existing. (It gets complicated, because on
Darwin, file sizes have always been 64-bit, but inode sizes
changed, but their solution does not involve making everyone refer
to stat64 objects...)

So I'm pretty sure we have to do something a little fancier here,
but I am not 100% sure what the right answer is. Of course, the
Darwin support, which was put in because of all the people telling
me that oe-core would run on OS X as soon as pseudo ran there, has
become a little less exciting of late. :)

Alternatives:
* Check for errno 75 and treat it as harmless.
* Ensure that pseudo is built with -D_FILE_OFFSET_BITS=64 on Linux.

I am not sure whether that latter would work when using pseudo with
other applications not built that way. Or, alternatively, whether
it would work to use pseudo NOT built that way with 32 bit
applications which were; I hadn't realized it was a setting.  :)

So I'm all for fixing this, but the proposed patch looks to me like
it might break things, just because I have low confidence that
treating a stat64 structure as a stat32 would be safe...

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


