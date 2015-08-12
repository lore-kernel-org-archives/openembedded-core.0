Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 92018767AC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 14:34:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7CEY93v001908
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Aug 2015 07:34:09 -0700 (PDT)
Received: from Marks-MacBook-Pro-2.local (172.25.36.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.235.1; Wed, 12 Aug 2015 07:34:08 -0700
To: Patrick Ohly <patrick.ohly@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1439281753.git.patrick.ohly@intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <55CB5960.9010708@windriver.com>
Date: Wed, 12 Aug 2015 09:34:08 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:38.0)
	Gecko/20100101 Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <cover.1439281753.git.patrick.ohly@intel.com>
Subject: Re: [PATCH 0/3] preserve xattrs in images
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
X-List-Received-Date: Wed, 12 Aug 2015 14:34:12 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

Is there something here that enables the tar-replacement-native?  Or is the user
just expected to know they need it?

If you look at meta/classes/sanity.bbclass, there is already a tar check for a
specific old version that can't handle overwriting symlinks properly.  It should
be possible to check for the distro feature of xattr and that the host tar has
this.  It would be good to prevent the user from having a problem early (sanity)
rather then at filesystem generation time.

--Mark

On 8/11/15 3:44 AM, Patrick Ohly wrote:
> Both Smack and IMA/EVM rely on xattrs in the rootfs. This works for
> .ext3/.ext4 images, but not for .jffs2 and .tar.bz2. These changes
> allow optionally building also such images with xattrs without
> changing the default (which still is to ignore xattrs in .jffs2 and
> .tar.bz2).
> 
> The default does not get changed because supporting xattrs causes a
> certain overhead (need to build GNU tar, additional system calls when
> creating the images).
> 
> See https://github.com/01org/meta-intel-iot-security/pull/34 for code using
> these changes.
> 
> The following changes since commit 5094354a2811825e6d60963f03959daa349cab23:
> 
>   bind: upgrade to 9.10.2-p3 (2015-08-09 15:14:32 -0700)
> 
> are available in the git repository at:
> 
>   git://github.com/pohly/openembedded-core xattr
>   https://github.com/pohly/openembedded-core/tree/xattr
> 
> Patrick Ohly (3):
>   tar-replacement-native: avoid race condition with host tar
>   image_types.bbclass: allow replacing tar command
>   mtd-utils: keep xattr support enabled
> 
>  meta/classes/image_types.bbclass                         | 13 ++++++++++++-
>  meta/recipes-devtools/mtd/mtd-utils_git.bb               |  2 +-
>  meta/recipes-extended/tar/tar-replacement-native_1.28.bb | 14 +++++++++++++-
>  3 files changed, 26 insertions(+), 3 deletions(-)
> 


