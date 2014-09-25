Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E96E3715C5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 02:32:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8P2WkYt014484
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Sep 2014 19:32:46 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 24 Sep 2014 19:32:46 -0700
Message-ID: <54237ECC.5010008@windriver.com>
Date: Thu, 25 Sep 2014 10:32:44 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1409813992.git.liezhi.yang@windriver.com>
	<030c29236dc8bc0b8df2f9a2973c0997a91023b5.1409813992.git.liezhi.yang@windriver.com>
	<1409819233.12482.25.camel@ted> <540827B3.50509@windriver.com>
	<1409820816.12482.30.camel@ted> <54083E97.9000005@windriver.com>
	<CAJTo0LbKV=-sFB7=-q9zxakdfjtBzuK0rDbEwwFd-vD9_z2=+Q@mail.gmail.com>
In-Reply-To: <CAJTo0LbKV=-sFB7=-q9zxakdfjtBzuK0rDbEwwFd-vD9_z2=+Q@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] sstate.bbclass: update the timestamps after install
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
X-List-Received-Date: Thu, 25 Sep 2014 02:32:47 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 09/25/2014 06:37 AM, Burton, Ross wrote:
> Hi Robert,
>
> On 4 September 2014 11:27, Robert Yang <liezhi.yang@windriver.com> wrote:
>> Under more thoughts, yes, we need the --no-dereferece otherwise the
>> touch may update the file in the SSTATE_MIRRORS, and it's safe to touch
>> a symlink itself (though "test -w" follows symlink) since the permissions
>> of symbolic links are never used.
>>
>> For readonly_dir/ssfile, we can touch the ssfile if "test -w ssfile",
>> it doesn't care about the dir's write permission. Or do we have to
>> check the permission of "dirname ${SSTATE_PKG}" and ${SSTATE_DIR} ?
>> I don't think that we need unless it causes errors.
>>
>> For the ISO, the "test -w {SSTATE_PKG}" would fail so that no touch,
>> here is the updated code, also in the repo:
>
> Can you update this patch with --no-dereference please, or have I
> misunderstood the conversation?

Thanks, updated:

   git://git.openembedded.org/openembedded-core-contrib rbt/ss

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 4057c8c..552ff8d 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -623,6 +623,8 @@ sstate_unpack_package () {
         mkdir -p ${SSTATE_INSTDIR}
         cd ${SSTATE_INSTDIR}
         tar -xmvzf ${SSTATE_PKG}
+       # Use "! -w ||" to return true for read only files
+       [ ! -w ${SSTATE_PKG} ] || touch --no-dereference ${SSTATE_PKG}
  }

// Robert

>
> Ross
>
>

