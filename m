Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.59])
 by mx.groups.io with SMTP id smtpd.web09.22461.1611827297194229929
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 01:48:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ae/EbXM0;
 spf=pass (domain: windriver.com, ip: 40.107.92.59, mailfrom: wenlin.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dktEAVQmqMfkj0j6XOFSAa8xLW128ZB0OnYpEj3XvkQzNRovVIlpX4WytxZtVLauqhdPdDcDri005d95rCKoqoM9Hins4GJNaCVYN6O6nxM0Y0lBzy1/aEY9vl+Z4CIfn9YZd6UF/qj5SnVsoF88HzVKKlAgkQ2K/5kI6ZV/6674L8YhTu/xpxikvjuKY63YOg6lJrYGZ0q9ve3MOd5VWIBesTgHzqQRlS27nOO6grIvBjFVCnWTBZ/qwEWd70zS/wW8+B7QO4UE/UiW+VQXEyzbP/ErEDcnnr05/jcTarVbsd0X10Tyd+GZn4c9rLNrPqZUFXw8k6pfVY73ZDDG8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=amfBjQQa7w+HwZwxGw+QG6+Ae3iv/yuUcDG6dM8W+qY=;
 b=WkIE2HotXLJ53W1w6w0fageazRP5QqBDMRlTlEmBRP9478OOD59ocmlBt1J5uBNspgu5UIuEignTgj54/gKSkbffOTpEdCFEqoNzClq4AZHWoF0E0iiLzyC+qRDc4n/RlL3Pg6qT+qx3SphgN79E5jtn8Ls9cT417dusXGXUpGON87+4/+qJL35AegD0UrFweCZxJE/JxSXf44XpEU8MMfFl3dq5Z5vaji11vayap6WXjtAlIYgpYQGYM/D8dOq9/2CKFJRVK5JuGk2ICWYZwf0/rRFgPGcfFkGKtUXEcO9u4UvQx+EDdJ8xmPpk1lZsbR8tSfKCP5CI/hW2PSEE1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=amfBjQQa7w+HwZwxGw+QG6+Ae3iv/yuUcDG6dM8W+qY=;
 b=ae/EbXM00a0V1/oCqCCb6sEyFOVKqtRBvTXlgZIDUf0WfzYqaiT0zDvoZ2jGD/6gmWkaC2+CgoREi9ELl9oDr2aBE5EUmDQar1DC5nhowkyrhgJd+Jgi+3/kggsOoM2FITNyiUdEtOwNQkA1uTb/hutXkTLUD4w7U7QBX4m1W/o=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5202.namprd11.prod.outlook.com (2603:10b6:303:95::17)
 by MWHPR11MB1725.namprd11.prod.outlook.com (2603:10b6:300:2a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.15; Thu, 28 Jan
 2021 09:48:15 +0000
Received: from CO1PR11MB5202.namprd11.prod.outlook.com
 ([fe80::7185:40a2:d776:77af]) by CO1PR11MB5202.namprd11.prod.outlook.com
 ([fe80::7185:40a2:d776:77af%6]) with mapi id 15.20.3805.017; Thu, 28 Jan 2021
 09:48:15 +0000
From: "wenlin.kang@windriver.com" <wenlin.kang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] libsdl2: fix CVE-2020-14409 CVE-2020-14410
Date: Thu, 28 Jan 2021 01:48:09 -0800
Message-Id: <20210128094809.77924-1-wenlin.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [147.11.105.123]
X-ClientProxiedBy: SJ0PR05CA0181.namprd05.prod.outlook.com
 (2603:10b6:a03:330::6) To CO1PR11MB5202.namprd11.prod.outlook.com
 (2603:10b6:303:95::17)
Return-Path: wenlin.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp2.wrs.com (147.11.105.123) by SJ0PR05CA0181.namprd05.prod.outlook.com (2603:10b6:a03:330::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.8 via Frontend Transport; Thu, 28 Jan 2021 09:48:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 845d07b5-c387-4797-9cb0-08d8c371d59c
X-MS-TrafficTypeDiagnostic: MWHPR11MB1725:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB172595791A3D15BF012E9AA0E1BA9@MWHPR11MB1725.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bzqPmcxa+Vs1IXVL0Nj+TNTQAwZ8x41b847zPivpWwdrjlNvKCpJCoBqmyIfa7PyZHZeEZcc9h1Legaxgrcn2pxnUxFvds/H7iGarHCm5iE2YQEIcu5bD48qLkRnfrik6grOZJ1j5o0MvXQ/i15DGb7cBBSWa0Yi+0zY32OVNYOxkWepq6pQF5gl/cfCgfMWfVbfRUVGv5KB4yIHSjkchOSOTGKWDkF0UCREFtrAX2UprhF6Sh1IcDOruqRNu/LECRNH/C2FFpvcG1eBr9UfO8Gh2QFEpGGIJ/yoT9pkdUb3sr4E0Or3/PNvFH0Mt3kIg1/j+kRLVeYJ4J4kCNVnYBfE0W0bTSXlFHDQO7DNhQuv0r6P5g5yRl+4sY0CYWvRV7hTsyCWMsT5YHtZlfJ6wnB70trG7MywYh6akBjvdJdhN/UHFKcRJlqZXL/UeLRek4rR8FKjuuh3akRbwvecdCQJ8ud6fGGXeKqPLxENng823mWN9/vXA+x4gNnFb8DVxe8gx+nzFz8/46FOf6Oo64ipMkWMlEAt8s0Uwt+1uANL/2/j307jJmCegin5nbaF6tvjz72IqGxZgaCEVCnIIe8xHpxTjHCnlmEKTPcYBJqX2lacBGsKY2ZgO9s+s+Gj33EfMO6zA+1Z0EaKGqkeyQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5202.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(396003)(376002)(136003)(366004)(2616005)(478600001)(36756003)(316002)(83380400001)(8676002)(956004)(66476007)(6486002)(966005)(186003)(16526019)(83080400002)(66556008)(6666004)(8936002)(2906002)(6916009)(5660300002)(26005)(66946007)(1076003)(6506007)(6512007)(86362001)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?FOkkZIlVxIhmEI2OebMCdlxtFspIzyWo9Cq6clCDY7mV4Dk2mwWb1CdtcwS+?=
 =?us-ascii?Q?EC39zRpH4WcSFlJm/KcJe1XdoXNf41w0Tp6OXl2saDyjBzRZ0eWsmMS86IYJ?=
 =?us-ascii?Q?5VkRAN/1zUVHh7N2ELWVIzXBnqHCl2goHjJZ/E9+uy2fFcROQzDeUNEopy4W?=
 =?us-ascii?Q?qOLmBA1qtIiAhEbQMTUG0xxN9mPlYK2vpAfO/jmej7JKuY+0xHdyqpVO81oi?=
 =?us-ascii?Q?KyLzFUUQDnhEq1ciuMaSKlGl1xZfYboBiDVJ6CTC8Xho1hWIWu0TtqfgTxYY?=
 =?us-ascii?Q?x1W8ecT1ISWbcOa9dbEnVKH9LcgCc6ZbDsnXmXr+KXf7OVh2Ce4KqVyoecNQ?=
 =?us-ascii?Q?HB7W+nPCwI+NKg/SVQ4Hih7PJhS59s3Q2ZpMsy7p32/SJZ+hfGeF5/8UAk/k?=
 =?us-ascii?Q?wHH2zdwCHmWNc4P3hxm3el/mnGCCtYf6fJlS9OGxe/pobZW4kND8HSKKLH8F?=
 =?us-ascii?Q?E5OV4G7BJe0vmb5rukI8jk9maI/pbXJIY3LTyRVPRoYpAb6UEZOo4DjQ0rvH?=
 =?us-ascii?Q?MYtSIW2/+VBKWJCvArJ8xTPSv2rX+0BmQkx8AvwRfirJJ3bKCbChg1n2XZ64?=
 =?us-ascii?Q?0a0svJEGxl5zvSj+HW8u6/g7TU881bvxLOMIqEt6fItLGZw50LpqPW06FF0t?=
 =?us-ascii?Q?4ocSTOmtS6b59fCev9AV13AwCEVuGp5vnn1ku86LBnJl6yGknKuHSsK6A1Qu?=
 =?us-ascii?Q?vI4HZa//rUF8y9ZeIix1jO9agOZhy2DHtX+0k23zFUwQNc1JGcA3VuU05jA5?=
 =?us-ascii?Q?2CUzAJy2xUvzdvQMSQsqdQ7RPeecYIasaPQ295+6Hn67bHROtyhmq17qr4Al?=
 =?us-ascii?Q?4++B18IzsECEmCYYBPk0ZRCwPHkJ2UFREc093LwO09Z27yVwNmiOR3DWLy/7?=
 =?us-ascii?Q?1oXBiJ10t1I4L9+nEVhG4cfqB6Dv2ObQ4LaZiqVLFB1/N+l+WeXU+uuDhunJ?=
 =?us-ascii?Q?qgv0JLNWWdq4ywd5Hk9RTWM3GnwMYr4+L+nXORY2MYP2RqUxRM2cHh6kuHLn?=
 =?us-ascii?Q?lcu7hqv34EApRrBABLXfJz8idn/IOigw1Jm5ZkX6DOgbH87/NZiSinsa3Y/h?=
 =?us-ascii?Q?e4UVo0nx?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 845d07b5-c387-4797-9cb0-08d8c371d59c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5202.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 09:48:15.6432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t3IVtqQDDu9X/MZlDUqzhT68BhuffwqAYYRwQhUmkuTWVCX2E95N7ZwVoIeknRwwQJFBtlmvd6gn68YfdgXZBP2eBopJI4jVC3xY80NSNXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1725
Content-Type: text/plain

From: Wenlin Kang <wenlin.kang@windriver.com>

CVE-2020-14409
SDL (Simple DirectMedia Layer) through 2.0.12 has an Integer Overflow (and
resultant SDL_memcpy heap corruption) in SDL_BlitCopy in video/SDL_blit_copy.c
via a crafted .BMP file.

CVE-2020-14410
SDL (Simple DirectMedia Layer) through 2.0.12 has a heap-based buffer over-read
in Blit_3or4_to_3or4__inversed_rgb in video/SDL_blit_N.c via a crafted .BMP file.

References:
https://nvd.nist.gov/vuln/detail/CVE-2020-14409
https://nvd.nist.gov/vuln/detail/CVE-2020-14410

Upstream patches:
https://hg.libsdl.org/SDL/rev/3f9b4e92c1d9
https://hg.libsdl.org/SDL/rev/ed0e044e308c

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 .../CVE-2020-14409-CVE-2020-14410-1.patch     | 84 +++++++++++++++++++
 .../CVE-2020-14409-CVE-2020-14410-2.patch     | 35 ++++++++
 .../libsdl2/libsdl2_2.0.12.bb                 |  2 +
 3 files changed, 121 insertions(+)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/CVE-2020-14409-CVE-2020-14410-1.patch
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/CVE-2020-14409-CVE-2020-14410-2.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/CVE-2020-14409-CVE-2020-14410-1.patch b/meta/recipes-graphics/libsdl2/libsdl2/CVE-2020-14409-CVE-2020-14410-1.patch
new file mode 100644
index 0000000000..aba21581de
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/CVE-2020-14409-CVE-2020-14410-1.patch
@@ -0,0 +1,84 @@
+From 1ede8ee20669d2c103c9568f75733b376b69e2d2 Mon Sep 17 00:00:00 2001
+From: Sam Lantinga <slouken@libsdl.org>
+Date: Wed, 27 Jan 2021 07:08:36 +0000
+Subject: [PATCH 1/2] Fixed overflow in surface pitch calculation
+
+Upstream-Status: Backport
+CVE: CVE-2020-14409,CVE-2020-14410
+
+Reference to upstream patch:
+https://hg.libsdl.org/SDL/rev/3f9b4e92c1d9
+
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+---
+ src/video/SDL_surface.c | 24 +++++++++++++++---------
+ 1 file changed, 15 insertions(+), 9 deletions(-)
+
+diff --git a/src/video/SDL_surface.c b/src/video/SDL_surface.c
+index 3795b94..c8075f1 100644
+--- a/src/video/SDL_surface.c
++++ b/src/video/SDL_surface.c
+@@ -27,25 +27,23 @@
+ #include "SDL_pixels_c.h"
+ #include "SDL_yuv_c.h"
+ 
+-
+-/* Check to make sure we can safely check multiplication of surface w and pitch and it won't overflow size_t */
+-SDL_COMPILE_TIME_ASSERT(surface_size_assumptions,
+-    sizeof(int) == sizeof(Sint32) && sizeof(size_t) >= sizeof(Sint32));
++/* Check to make sure we can safely check multiplication of surface w and pitch and it won't overflow Sint64 */
++SDL_COMPILE_TIME_ASSERT(surface_size_assumptions, sizeof(int) == sizeof(Sint32));
+ 
+ /* Public routines */
+ 
+ /*
+  * Calculate the pad-aligned scanline width of a surface
+  */
+-static int
++static Sint64
+ SDL_CalculatePitch(Uint32 format, int width)
+ {
+-    int pitch;
++    Sint64 pitch;
+ 
+     if (SDL_ISPIXELFORMAT_FOURCC(format) || SDL_BITSPERPIXEL(format) >= 8) {
+-        pitch = (width * SDL_BYTESPERPIXEL(format));
++        pitch = ((Sint64)width * SDL_BYTESPERPIXEL(format));
+     } else {
+-        pitch = ((width * SDL_BITSPERPIXEL(format)) + 7) / 8;
++	pitch = (((Sint64)width * SDL_BITSPERPIXEL(format)) + 7) / 8;
+     }
+     pitch = (pitch + 3) & ~3;   /* 4-byte aligning for speed */
+     return pitch;
+@@ -59,11 +57,19 @@ SDL_Surface *
+ SDL_CreateRGBSurfaceWithFormat(Uint32 flags, int width, int height, int depth,
+                                Uint32 format)
+ {
++    Sint64 pitch;
+     SDL_Surface *surface;
+ 
+     /* The flags are no longer used, make the compiler happy */
+     (void)flags;
+ 
++    pitch = SDL_CalculatePitch(format, width);
++    if (pitch < 0 || pitch > SDL_MAX_SINT32) {
++        /* Overflow... */
++        SDL_OutOfMemory();
++        return NULL;
++    }
++
+     /* Allocate the surface */
+     surface = (SDL_Surface *) SDL_calloc(1, sizeof(*surface));
+     if (surface == NULL) {
+@@ -78,7 +84,7 @@ SDL_CreateRGBSurfaceWithFormat(Uint32 flags, int width, int height, int depth,
+     }
+     surface->w = width;
+     surface->h = height;
+-    surface->pitch = SDL_CalculatePitch(format, width);
++    surface->pitch = (int)pitch;
+     SDL_SetClipRect(surface, NULL);
+ 
+     if (SDL_ISPIXELFORMAT_INDEXED(surface->format->format)) {
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/libsdl2/libsdl2/CVE-2020-14409-CVE-2020-14410-2.patch b/meta/recipes-graphics/libsdl2/libsdl2/CVE-2020-14409-CVE-2020-14410-2.patch
new file mode 100644
index 0000000000..929be75457
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/CVE-2020-14409-CVE-2020-14410-2.patch
@@ -0,0 +1,35 @@
+From 2029bd75a501623106cfd0400cffe38d22f1b005 Mon Sep 17 00:00:00 2001
+From: Sam Lantinga <slouken@libsdl.org>
+Date: Wed, 27 Jan 2021 07:25:26 +0000
+Subject: [PATCH 2/2] Reverted comment change in previous commit
+
+Upstream-Status: Backport
+CVE: CVE-2020-14409,CVE-2020-14410
+
+Reference to upstream patch:
+https://hg.libsdl.org/SDL/rev/ed0e044e308c
+
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+---
+ src/video/SDL_surface.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/video/SDL_surface.c b/src/video/SDL_surface.c
+index c8075f1..8d63b54 100644
+--- a/src/video/SDL_surface.c
++++ b/src/video/SDL_surface.c
+@@ -27,8 +27,9 @@
+ #include "SDL_pixels_c.h"
+ #include "SDL_yuv_c.h"
+ 
+-/* Check to make sure we can safely check multiplication of surface w and pitch and it won't overflow Sint64 */
+-SDL_COMPILE_TIME_ASSERT(surface_size_assumptions, sizeof(int) == sizeof(Sint32));
++/* Check to make sure we can safely check multiplication of surface w and pitch and it won't overflow size_t */
++SDL_COMPILE_TIME_ASSERT(surface_size_assumptions,
++    sizeof(int) == sizeof(Sint32) && sizeof(size_t) >= sizeof(Sint32));
+ 
+ /* Public routines */
+ 
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
index 5fa99821c4..4262efa995 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
@@ -20,6 +20,8 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
            file://more-gen-depends.patch \
            file://directfb-spurious-curly-brace-missing-e.patch \
            file://directfb-renderfillrect-fix.patch \
+           file://CVE-2020-14409-CVE-2020-14410-1.patch \
+           file://CVE-2020-14409-CVE-2020-14410-2.patch \
 "
 
 S = "${WORKDIR}/SDL2-${PV}"
-- 
2.17.1

