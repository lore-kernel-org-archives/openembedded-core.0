Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C0FAD761D3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 04:48:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6T4mNHB012713
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 21:48:23 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 28 Jul 2015 21:48:06 -0700
Message-ID: <55B85B15.4090801@windriver.com>
Date: Wed, 29 Jul 2015 12:48:21 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1438074152.git.liezhi.yang@windriver.com>
	<5f7249878baba13ed53de7fd5cc5a160a690d505.1438074152.git.liezhi.yang@windriver.com>
In-Reply-To: <5f7249878baba13ed53de7fd5cc5a160a690d505.1438074152.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 3/3] builder: fix USERADD_PARAM
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
X-List-Received-Date: Wed, 29 Jul 2015 04:48:27 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I updated this patch a little, we also need update the chown command:

   git://git.openembedded.org/openembedded-core-contrib rbt/useradd


diff --git a/meta/recipes-graphics/builder/builder_0.1.bb 
b/meta/recipes-graphics/builder/builder_0.1.bb
index 78d41e5..bb729fc 100644
--- a/meta/recipes-graphics/builder/builder_0.1.bb
+++ b/meta/recipes-graphics/builder/builder_0.1.bb
@@ -21,13 +21,13 @@ USERADD_PACKAGES = "${PN}"
  USERADD_PARAM_${PN} = "--system --create-home \
                         --groups video,tty,audio \
                         --password ${BUILDER_PASSWORD} \
-                       --user-group ${PN}"
+                       --user-group builder"

  do_install () {
         install -d -m 755 ${D}${sysconfdir}/mini_x/session.d
         install -p -m 755 builder_hob_start.sh ${D}${sysconfdir}/mini_x/session.d/

-       chown  ${PN}.${PN} ${D}${sysconfdir}/mini_x/session.d/builder_hob_start.sh
+       chown  builder.builder 
${D}${sysconfdir}/mini_x/session.d/builder_hob_start.sh
          install -p -m 755 please_wait_dialog.py ${D}${sysconfdir}/mini_x
  }

// Robert

On 07/28/2015 05:03 PM, Robert Yang wrote:
> When build lib32-builder, it would create the user lib32-builder which
> was incorrect.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta/recipes-graphics/builder/builder_0.1.bb |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/builder/builder_0.1.bb b/meta/recipes-graphics/builder/builder_0.1.bb
> index 78d41e5..d87d0e9 100644
> --- a/meta/recipes-graphics/builder/builder_0.1.bb
> +++ b/meta/recipes-graphics/builder/builder_0.1.bb
> @@ -21,7 +21,7 @@ USERADD_PACKAGES = "${PN}"
>   USERADD_PARAM_${PN} = "--system --create-home \
>                          --groups video,tty,audio \
>                          --password ${BUILDER_PASSWORD} \
> -                       --user-group ${PN}"
> +                       --user-group builder"
>
>   do_install () {
>   	install -d -m 755 ${D}${sysconfdir}/mini_x/session.d
>

