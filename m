Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C9BFF601D3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 21:39:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tB7LdU97015385
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Dec 2015 13:39:30 -0800 (PST)
Received: from Marks-MacBook-Pro.local (147.11.118.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Mon, 7 Dec 2015 13:39:29 -0800
To: <openembedded-core@lists.openembedded.org>
References: <1449524171-2835-1-git-send-email-mark.hatle@windriver.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <5665FC91.1050803@windriver.com>
Date: Mon, 7 Dec 2015 15:39:29 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1449524171-2835-1-git-send-email-mark.hatle@windriver.com>
Subject: Re: [PATCH] cross-canadian.bbclass: Add BASECANADIANEXTRAOS to specify main extraos
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
X-List-Received-Date: Mon, 07 Dec 2015 21:39:29 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

Sorry forgot to setup a cover letter.

The issue is that various extra OS entries cause numerous symlinks to be set.
These symlinks can cause confusion for someone looking in the directory.  They
may think uclibc or musl is actually supported.

However, the real problem is when you build an SDK for Windows (mingw), symlinks
get expanded on installation.  So you end up with a full copy of the toolchain
for each symlink.

This will increase (the installed) size of the x86_64 toolchain by 600MB, for no
real reason.

The change is equally applicable to master and jethro.

On 12/7/15 3:36 PM, Mark Hatle wrote:
> By default the system will expand the extra os entries for uclibc and musl
> even if they are not enabled in the build.  There was no way to prevent this
> behavior while still getting the expansion for things like x32 or spe.
> 
> The change adds a new setting which a distribution creator can override
> easily, setting the base set of canadianextraos components.  The other
> expansions are then based on this setting.
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/classes/cross-canadian.bbclass | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
> 


