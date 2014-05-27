Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 35A4F6FAC7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 19:01:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4RJ1uUC001284
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 12:01:56 -0700 (PDT)
Received: from e6410-2 (172.25.40.227) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 27 May 2014 12:01:55 -0700
Date: Tue, 27 May 2014 14:01:27 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Peter Seebach <peter.seebach@windriver.com>
Message-ID: <20140527140127.229d766e@e6410-2>
In-Reply-To: <9f01f929ce7aa2344836e9360a832899217626bb.1400713858.git.peter.seebach@windriver.com>
References: <cover.1400713858.git.peter.seebach@windriver.com>
	<9f01f929ce7aa2344836e9360a832899217626bb.1400713858.git.peter.seebach@windriver.com>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: WARNING: FILES GETTING MARKED WORLD-WRITEABLE. (Was: Re: [PATCH 1/1] pseudo: handle fchmodat better, mask out unwanted write bits)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 May 2014 19:02:00 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Wed, 21 May 2014 18:12:33 -0500
Peter Seebach <peter.seebach@windriver.com> wrote:

> +-#define PSEUDO_FS_MODE(mode, isdir) ((mode) | S_IRUSR | S_IWUSR | ((isdir) ? S_IXUSR : 0))
> +-#define PSEUDO_DB_MODE(fs_mode, user_mode) (((fs_mode) & ~0700) | ((user_mode & 0700)))
> ++#define PSEUDO_FS_MODE(mode, isdir) ((((mode) | S_IRUSR | S_IWUSR | ((isdir) ? S_IXUSR : 0)) & ~(S_IWGRP | S_IWOTH)) & ~(S_IWOTH | S_IWGRP))
> ++#define PSEUDO_DB_MODE(fs_mode, user_mode) (((fs_mode) & ~0722) | ((user_mode & 0722)))

So, someone just spotted a bug this introduces.

In the case where you're calling chmod, this produces exactly the results you
probably expect: Files end up with the specified mode in the database, and
with 022 masked out and 0700 masked in on the filesystem.

If you're using open or mkdir, though, the old code was picking up changes to
the mode from umask in the 077 bits (typically, 022), and the new code
doesn't because I ignore the 022 bits in the filesystem since I know I masked
them out.

I don't know how to solve this correctly yet, but basically I should be
taking umask into account.

I'll try to get a patch out for this ASAP.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.

