Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.64])
 by mx.groups.io with SMTP id smtpd.web10.10586.1595296530030165018
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2020 18:55:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=d/mIN+O4;
 spf=pass (domain: windriver.com, ip: 40.107.92.64, mailfrom: hongxu.jia@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qn4J8RbYRtjfhlCNn/5uwONkcbmmMEBKXmS0yyGQh9IJhYM59epEps+yGeVyj79HSyRUCCKQXjLiFTQCyC2hnrycjLQH1qnJt/rQccQanGwfqyQXe7SNr+Q3S/hS5rj/CfS2c2qFL2QQVVd0OdICuwrdkHcGsc+GoSoIhBsCzPbnQJlioCMF4UpePxv0TfmVeufI5Yiw3XLv+4GpUwnixAzgtfEK0MxWth4Y744eZCmtZHdKsSArWEHhHcODW5t6FdSK9iqb8GrlmkM0mNjx6diYaNkhJ32BwMFH76R2Bl83gNG05T4FGmSE6Vp6IrK/5kGFdRn3TTM+YRStuu6VdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dk1QCvzmEN9stYKB4aJRs7q8ohUE0wWv07qNmQzp7Kk=;
 b=kQe1zPkAfi1Wbu5JZbNbVQY7fxPbS+5a3LnGrX6nsI5cmO/6x3zo7ea7kG0ZVV/pu/Ws2Ceb+hABVQxp4Cx9uwF473+VvHz3r54iK/AvBhpd2kdZWWjRkLWNWbv8uJWaGWzlZHx8QnJ+C/VsYqWB7pQptBDbuQUFFbuJA3a/fu3UuCSoAzVp+u64y6+O6ZtPo03hS+PA728JsKf8RC536aTs6uxUuK3VV9AZD0/sCgjfsBIEcCv3RJ+V1eltbwiJaJSiB4V8GoimaNBO03YffTYExkkzE9SqMeU3VdFqhQRZq3w+QFdFWJRZ3cGpMKvNX7Hw5ndNrJv8bW75/tPb1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dk1QCvzmEN9stYKB4aJRs7q8ohUE0wWv07qNmQzp7Kk=;
 b=d/mIN+O4tpVYBWM02B2FKzWFEyfRWPLKON7wPCXT8C6mg43kznbNGh2pLnERIcBkKae1m0/BcpyVueB1STSz++TdXZdfKwvZMrknRamSSNVjoZ7HEZP3dITRhlxkWPC2NIcuVJ9XddpgCQkCxByoHLXYpW/RAU//dFP0X78XEgs=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB4369.namprd11.prod.outlook.com (2603:10b6:a03:1cb::25)
 by BYAPR11MB2568.namprd11.prod.outlook.com (2603:10b6:a02:c6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.23; Tue, 21 Jul
 2020 01:55:26 +0000
Received: from BY5PR11MB4369.namprd11.prod.outlook.com
 ([fe80::b8ba:cc41:e6f0:9cf4]) by BY5PR11MB4369.namprd11.prod.outlook.com
 ([fe80::b8ba:cc41:e6f0:9cf4%7]) with mapi id 15.20.3195.025; Tue, 21 Jul 2020
 01:55:26 +0000
Subject: Re: [OE-core] [PATCH] e2fsprogs: fix mkfs.ext4 not parse hardlink if file has a large inode number
From: "hongxu" <hongxu.jia@windriver.com>
To: openembedded-core@lists.openembedded.org,
 richard.purdie@linuxfoundation.org
References: <16237D0C4E6E651D.16385@lists.openembedded.org>
Message-ID: <01ce17f7-70c0-18b3-9d13-f52af4411bfc@windriver.com>
Date: Tue, 21 Jul 2020 09:55:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <16237D0C4E6E651D.16385@lists.openembedded.org>
X-ClientProxiedBy: HK2PR0401CA0017.apcprd04.prod.outlook.com
 (2603:1096:202:2::27) To BY5PR11MB4369.namprd11.prod.outlook.com
 (2603:10b6:a03:1cb::25)
Return-Path: hongxu.jia@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.148] (60.247.85.82) by HK2PR0401CA0017.apcprd04.prod.outlook.com (2603:1096:202:2::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17 via Frontend Transport; Tue, 21 Jul 2020 01:55:25 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 160cd5b6-fb61-4cac-37f9-08d82d192312
X-MS-TrafficTypeDiagnostic: BYAPR11MB2568:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB25684214ED17889A74121CDB94780@BYAPR11MB2568.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:72;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KeB0BMLgqVaDOv2cqGfSGmv/b8eSqI30hSDmJ3izObd9vGCT/uHed65FpIkpQR+PPyIpzVKL0Bf3ZhjgsmqSqNfL3gqYM/z4BC62Ow39yJaEp47fR3BzzyqwHjmkOzutAI37CImfx2bMWCDl+jzh4UukbEuvkJk6VVNS/ycpQck0bL0SBKdYUgJLexkttUb1xv8DU46aENGWp7bNHyDvdANkgn8bMfC6K5K/EF0G0ImIZJt5H/CtOp/LelpcSBvJlJf5XTAlq7pZ/3UQDTd/MS27lcB7h9y1CQESQJWApJVDUUARwSc13bDu9NF3fdSXRSjyalTqHiHdGCSYYf+fJlM5pxx4lJR4Ky8tKEyiBZWT8tkbya/o+f5DQqJOsMV8IlWCQEUSjHY61FF0MZELraAX/l02ATax9bnLiRzhgNnWBONx1D0rZVLVqaSr8aG/J1cia6Z5f8lLNVK+afORXM/BRy/JlqSKJ7xGU1WRsRjrYlpkXHGq9a+nkaZQRab9ct3QTyV6/BoY5fGGlf2W9A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4369.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(366004)(136003)(346002)(396003)(376002)(83380400001)(6486002)(66946007)(31686004)(8936002)(316002)(16576012)(5660300002)(36756003)(6706004)(2906002)(31696002)(66556008)(66476007)(86362001)(166002)(966005)(478600001)(44832011)(8676002)(53546011)(956004)(2616005)(186003)(16526019)(26005)(33964004)(6666004)(52116002)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	QkgIrTcQ0tPUqUxWyWZsrDgUFbXa8CBJ5eb/M5tNBEV8Rugy0xQry4F8W94pr6bXpVJM2/CjMGbihVRKduk287E6HDwlKQpXTz+aVX0L8uizyH29lDAurowjq9AjUsicK8QB6ht6I2+XArEQScVkkt22FK2h1r3pNaXgMXQAfl/IGc7uGeLGnObTQ8Oh03fn9KqPJ4ZCfbPr7is5g04dVI7SDjuDwgtDU36Ey3ajaQSKGVFxdgup+U9b62Go2eTzR27jpdle0C8WkS7xhdfPWsK0oPjF0ultm0SWxD6gvBYDIA3JZI7JbQG2Ul9ccsPXCnblQlV2z2+dKqDp8a3izcMvd9bObUV43vOOlB1rpcdBxdTfBDQ5W6+ArqMK5uBALkQxXFk/Ax4Vpm2VGV7vDktGFArM5p9fGaSXnJMyGnWe3+omexMt3f7xPwiy/AUdlhuus2ujmx+Da++v1MfL6utxVDXwQyAdSXs3fHse54E=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 160cd5b6-fb61-4cac-37f9-08d82d192312
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4369.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2020 01:55:26.2711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tqHVuVpEx00T1/6nnOtABZggvr5zw7Cga+tndEQ7O4osy9GYpJss8VtC22ZkqjFy0ZphxFr+5yMITpqqh/rLsvRhfsiin8L/DJyIvkfSmb0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2568
Content-Type: multipart/alternative;
 boundary="------------5EDAA967FE8BDD63C474F84A"
Content-Language: en-US

--------------5EDAA967FE8BDD63C474F84A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Please ignore this, V2 incoming

//Hongxu

On 7/20/20 10:42 PM, hongxu wrote:
> While file has a large inode number, mkfs.ext4 could not parse
> hardlink.
>
> $ ls -il rootfs_ota/a rootfs_ota/boot/b rootfs_ota/boot/c
> 11026675846 -rw-r--r-- 3 hjia users 0 Jul 20 17:44 rootfs_ota/a
> 11026675846 -rw-r--r-- 3 hjia users 0 Jul 20 17:44 rootfs_ota/boot/b
> 11026675846 -rw-r--r-- 3 hjia users 0 Jul 20 17:44 rootfs_ota/boot/c
>
> $ truncate -s 1M rootfs_ota.ext4
>
> $ mkfs.ext4 -F -i 8192 rootfs_ota.ext4 -L otaroot -U fd5f8768-c779-4dc9-adde-165a3d863349 -d rootfs_ota
>
> $ mkdir mnt && sudo mount rootfs_ota.ext4 mnt
>
> $ ls -il mnt/rootfs_ota/a mnt/rootfs_ota/boot/b
> 12 -rw-r--r-- 1 hjia users 0 Jul 20 17:44 mnt/a
> 14 -rw-r--r-- 1 hjia users 0 Jul 20 17:44 mnt/boot/b
> 15 -rw-r--r-- 1 hjia users 0 Jul 20 17:44 mnt/boot/c
>
> After applying this fix
> $ ls -il mnt/rootfs_ota/a mnt/rootfs_ota/boot/b
> 12 -rw-r--r-- 3 hjia users 0 Jul 20 17:44 mnt/a
> 12 -rw-r--r-- 3 hjia users 0 Jul 20 17:44 mnt/boot/b
> 12 -rw-r--r-- 3 hjia users 0 Jul 20 17:44 mnt/boot/c
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   ...-up-check-for-hardlinks-not-accurate.patch | 54 +++++++++++++++++++
>   .../e2fsprogs/e2fsprogs_1.45.6.bb             |  1 +
>   2 files changed, 55 insertions(+)
>   create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-fix-up-check-for-hardlinks-not-accurate.patch
>
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-fix-up-check-for-hardlinks-not-accurate.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-fix-up-check-for-hardlinks-not-accurate.patch
> new file mode 100644
> index 0000000000..0a0687651d
> --- /dev/null
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-fix-up-check-for-hardlinks-not-accurate.patch
> @@ -0,0 +1,54 @@
> +From c8b243a94a8d2d0a63d353d5d6e91aa6e780e4a2 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Mon, 20 Jul 2020 20:53:23 +0800
> +Subject: [PATCH] fix up check for hardlinks not accurate
> +
> +Since commit [382ed4a1 e2fsck: use proper types for variables][1]
> +applied, the input params `ino' of is_hardlink, it used ext2_ino_t
> +instead of ino_t for referencing inode numbers, but it missed to do the
> +same thing on `src_ino' which is used to compare with `ino'.
> +Comparing between different types may cause the hardlinks check is
> +not accurate.
> +
> +[snip misc/create_inode.c]
> +static int is_hardlink(struct hdlinks_s *hdlinks, dev_t dev, ext2_ino_t ino)
> +{
> +    int i;
> +
> +    for (i = 0; i < hdlinks->count; i++) {
> +        if (hdlinks->hdl[i].src_dev == dev &&
> +            hdlinks->hdl[i].src_ino == ino)
> +            return i;
> +    }
> +    return -1;
> +}
> +[snip misc/create_inode.c]
> +
> +Change the type of src_ino to ext2_ino_t, the reason why uses ext2_ino_t
> +instead of ino_t for referencing inode numbers at [2]
> +
> +[1] https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/commit/?id=382ed4a1c2b60acb9db7631e86dda207bde6076e
> +[2] https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/commit/?id=31dbecd482405e0d3a67eb58e1a1c8cb9f2ad83e
> +
> +Upstream-Status: Submitted [https://github.com/tytso/e2fsprogs/pull/47]
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + misc/create_inode.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/misc/create_inode.h b/misc/create_inode.h
> +index b5eeb420..0561a78a 100644
> +--- a/misc/create_inode.h
> ++++ b/misc/create_inode.h
> +@@ -11,7 +11,7 @@
> + struct hdlink_s
> + {
> + 	dev_t src_dev;
> +-	ino_t src_ino;
> ++	ext2_ino_t src_ino;
> + 	ext2_ino_t dst_ino;
> + };
> +
> +--
> +2.18.2
> +
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb
> index 4ad5b03cac..7b6d2c3b45 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb
> @@ -6,6 +6,7 @@ SRC_URI += "file://remove.ldconfig.call.patch \
>              file://mkdir_p.patch \
>              file://0001-configure.ac-correct-AM_GNU_GETTEXT.patch \
>              file://0001-intl-do-not-try-to-use-gettext-defines-that-no-longe.patch \
> +           file://0001-fix-up-check-for-hardlinks-not-accurate.patch \
>              "
>   
>   SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
>
> 



--------------5EDAA967FE8BDD63C474F84A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Please ignore this, V2 incoming</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">//Hongxu<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 7/20/20 10:42 PM, hongxu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:16237D0C4E6E651D.16385@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">While file has a large inode number, mkfs.ext4 could not parse
hardlink.

$ ls -il rootfs_ota/a rootfs_ota/boot/b rootfs_ota/boot/c
11026675846 -rw-r--r-- 3 hjia users 0 Jul 20 17:44 rootfs_ota/a
11026675846 -rw-r--r-- 3 hjia users 0 Jul 20 17:44 rootfs_ota/boot/b
11026675846 -rw-r--r-- 3 hjia users 0 Jul 20 17:44 rootfs_ota/boot/c

$ truncate -s 1M rootfs_ota.ext4

$ mkfs.ext4 -F -i 8192 rootfs_ota.ext4 -L otaroot -U fd5f8768-c779-4dc9-adde-165a3d863349 -d rootfs_ota

$ mkdir mnt &amp;&amp; sudo mount rootfs_ota.ext4 mnt

$ ls -il mnt/rootfs_ota/a mnt/rootfs_ota/boot/b
12 -rw-r--r-- 1 hjia users 0 Jul 20 17:44 mnt/a
14 -rw-r--r-- 1 hjia users 0 Jul 20 17:44 mnt/boot/b
15 -rw-r--r-- 1 hjia users 0 Jul 20 17:44 mnt/boot/c

After applying this fix
$ ls -il mnt/rootfs_ota/a mnt/rootfs_ota/boot/b
12 -rw-r--r-- 3 hjia users 0 Jul 20 17:44 mnt/a
12 -rw-r--r-- 3 hjia users 0 Jul 20 17:44 mnt/boot/b
12 -rw-r--r-- 3 hjia users 0 Jul 20 17:44 mnt/boot/c

Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
---
 ...-up-check-for-hardlinks-not-accurate.patch | 54 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 .../e2fsprogs/e2fsprogs_1.45.6.bb             |  1 &#43;
 2 files changed, 55 insertions(&#43;)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-fix-up-check-for-hardlinks-not-accurate.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-fix-up-check-for-hardlinks-not-accurate.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-fix-up-check-for-hardlinks-not-accurate.patch
new file mode 100644
index 0000000000..0a0687651d
--- /dev/null
&#43;&#43;&#43; b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-fix-up-check-for-hardlinks-not-accurate.patch
@@ -0,0 &#43;1,54 @@
&#43;From c8b243a94a8d2d0a63d353d5d6e91aa6e780e4a2 Mon Sep 17 00:00:00 2001
&#43;From: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
&#43;Date: Mon, 20 Jul 2020 20:53:23 &#43;0800
&#43;Subject: [PATCH] fix up check for hardlinks not accurate
&#43;
&#43;Since commit [382ed4a1 e2fsck: use proper types for variables][1]
&#43;applied, the input params `ino' of is_hardlink, it used ext2_ino_t
&#43;instead of ino_t for referencing inode numbers, but it missed to do the
&#43;same thing on `src_ino' which is used to compare with `ino'.
&#43;Comparing between different types may cause the hardlinks check is
&#43;not accurate.
&#43;
&#43;[snip misc/create_inode.c]
&#43;static int is_hardlink(struct hdlinks_s *hdlinks, dev_t dev, ext2_ino_t ino)
&#43;{
&#43;    int i;
&#43;
&#43;    for (i = 0; i &lt; hdlinks-&gt;count; i&#43;&#43;) {
&#43;        if (hdlinks-&gt;hdl[i].src_dev == dev &amp;&amp;
&#43;            hdlinks-&gt;hdl[i].src_ino == ino)
&#43;            return i;
&#43;    }
&#43;    return -1;
&#43;}
&#43;[snip misc/create_inode.c]
&#43;
&#43;Change the type of src_ino to ext2_ino_t, the reason why uses ext2_ino_t
&#43;instead of ino_t for referencing inode numbers at [2]
&#43;
&#43;[1] <a class="moz-txt-link-freetext" href="https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/commit/?id=382ed4a1c2b60acb9db7631e86dda207bde6076e">https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/commit/?id=382ed4a1c2b60acb9db7631e86dda207bde6076e</a>
&#43;[2] <a class="moz-txt-link-freetext" href="https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/commit/?id=31dbecd482405e0d3a67eb58e1a1c8cb9f2ad83e">https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/commit/?id=31dbecd482405e0d3a67eb58e1a1c8cb9f2ad83e</a>
&#43;
&#43;Upstream-Status: Submitted [<a class="moz-txt-link-freetext" href="https://github.com/tytso/e2fsprogs/pull/47">https://github.com/tytso/e2fsprogs/pull/47</a>]
&#43;Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
&#43;---
&#43; misc/create_inode.h | 2 &#43;-
&#43; 1 file changed, 1 insertion(&#43;), 1 deletion(-)
&#43;
&#43;diff --git a/misc/create_inode.h b/misc/create_inode.h
&#43;index b5eeb420..0561a78a 100644
&#43;--- a/misc/create_inode.h
&#43;&#43;&#43;&#43; b/misc/create_inode.h
&#43;@@ -11,7 &#43;11,7 @@
&#43; struct hdlink_s
&#43; {
&#43; 	dev_t src_dev;
&#43;-	ino_t src_ino;
&#43;&#43;	ext2_ino_t src_ino;
&#43; 	ext2_ino_t dst_ino;
&#43; };
&#43; 
&#43;-- 
&#43;2.18.2
&#43;
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb
index 4ad5b03cac..7b6d2c3b45 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb
&#43;&#43;&#43; b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb
@@ -6,6 &#43;6,7 @@ SRC_URI &#43;= <a class="moz-txt-link-rfc2396E" href="file://remove.ldconfig.call.patch\file://mkdir_p.patch\file://0001-configure.ac-correct-AM_GNU_GETTEXT.patch\file://0001-intl-do-not-try-to-use-gettext-defines-that-no-longe.patch\&#43;file://0001-fix-up-check-for-hardlinks-not-accurate.patch\">&quot;file://remove.ldconfig.call.patch \
            file://mkdir_p.patch \
            file://0001-configure.ac-correct-AM_GNU_GETTEXT.patch \
            file://0001-intl-do-not-try-to-use-gettext-defines-that-no-longe.patch \
&#43;           file://0001-fix-up-check-for-hardlinks-not-accurate.patch \
            &quot;</a>
 
 SRC_URI_append_class-native = &quot; <a class="moz-txt-link-freetext" href="file://e2fsprogs-fix-missing-check-for-permission-denied.patch">file://e2fsprogs-fix-missing-check-for-permission-denied.patch</a> \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------5EDAA967FE8BDD63C474F84A--
