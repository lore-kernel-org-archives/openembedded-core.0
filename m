Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42379C43334
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 15:35:28 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web09.31925.1655739322479048793
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 08:35:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HEWMtKJB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id n1so14960649wrg.12
        for <Openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 08:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=rIH8v5FEyrddWmuV9ZvskGH7Mcd4azyC6YfX6NuvfwY=;
        b=HEWMtKJBBhiLtfcaaTbFqFaZ6PqBBjcPgDZk2wZdu9BL6mmSNqPu5y/0av+OWTGTGq
         vGP0wmKTxTHoH528VVCiN8/+M5fP/ew8DY+sPHsAfyrbIZbwPqoNOw3gd+T80tkEy/Ao
         VKKDmoW8jyiLyJOGb5qHYiR+Vg8t8yqg4goCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=rIH8v5FEyrddWmuV9ZvskGH7Mcd4azyC6YfX6NuvfwY=;
        b=iyrFPNkJqyxBUN59ooMAnYzfbXly7WpLgHBPml7ucGJLxI60AlNzQW6UrnQN1cABoj
         jxvomAU9yiU7lsED7byl/qsl2h3hfQBQwNu7H4+SjjTjLphzPGZVRm/vulZ4cruYa2d5
         hhtXExf/eEjJy8ZHSyahZ5DFphWBYSXJlwzPTGhexwdKamV8WCnEQxJD89U7VAMRbGK3
         mef7sFCj5dRPM2i+tqgYD2F0Sxr0iou1vAffzpqg2lFcisljaRYi97Kq4/dn18aB7122
         whacAmVwpFQJEL/Fp6qsSHcuX5V51Ci2a6geZF5QRvW1vSGc+XVEg1lcMDuXzgBiTlxj
         /Ylw==
X-Gm-Message-State: AJIora8l2GH5aewaMDPNp0Z2hhImSabmLE9g4BN0JmorIR3JYsCXhlD9
	NWqQ2jprxO2/JzaGreDX3B285g==
X-Google-Smtp-Source: 
 AGRyM1t6Ut7bedawJSPvNQnFJTK32SyNCY5M3c+veyRD7IaxAUhSkHsuNhI/kUBjMJX/LPDREs9XqA==
X-Received: by 2002:a5d:48c8:0:b0:21b:826a:6f86 with SMTP id
 p8-20020a5d48c8000000b0021b826a6f86mr15744367wrs.220.1655739320591;
        Mon, 20 Jun 2022 08:35:20 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c772:780f:413d:4b79?
 ([2001:8b0:aba:5f3c:c772:780f:413d:4b79])
        by smtp.gmail.com with ESMTPSA id
 u15-20020adfdb8f000000b002101ed6e70fsm13746784wri.37.2022.06.20.08.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 08:35:19 -0700 (PDT)
Message-ID: 
 <f716cdce4cdc39440223c4dd87adba91fb7ba6f5.camel@linuxfoundation.org>
Subject: Re: [OE-core] externalsrc wiping out external source directory
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kristian Amlie <kristian.amlie@northern.tech>, OE-core
	 <Openembedded-core@lists.openembedded.org>
Date: Mon, 20 Jun 2022 16:35:18 +0100
In-Reply-To: <27095ef6-ad42-58d2-5242-60584bd6d139@northern.tech>
References: <f3eb760d-07f2-b5ca-a425-fc1166be8064@northern.tech>
	 <01c18d2c70290294a649df5c8e044b9d680ebf82.camel@linuxfoundation.org>
	 <fb8c122a-9524-af6f-8b53-489a9a035f74@northern.tech>
	 <b5c562b9ef7f999b4c655cc45e8c50a9d472c81f.camel@linuxfoundation.org>
	 <ef9a8546-e0a0-b346-cd3b-1a955088c11d@northern.tech>
	 <27095ef6-ad42-58d2-5242-60584bd6d139@northern.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jun 2022 15:35:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167120

On Mon, 2022-06-20 at 13:56 +0200, Kristian Amlie wrote:
> Just for the record, and for any people googling this: Until this is=20
> fixed, just reverting the above commit works to fix this problem.
>=20
> Richard, correct me if I'm wrong, but I have not yet seen any fixes for=
=20
> this. And unfortunately this is too deep in Bitbake for me to fix it=20
> myself. Do you think it makes sense to revert that commit in the=20
> official poky branches? I mean, the consequences of this bug are=20
> unusually dire. Especially in combination with go's common pattern of=20
> putting all source code in one directory, externalsrc can wipe out most=
=20
> of the source code in the user's home directory.

The situation is rather poor, yes :(. Sadly not many people want to get
involved with the core enough to try and work on these kinds of issues.
There are a couple of ways we could perhaps improve things. I've a
couple of patches (untested but you'll get the idea). Firstly:

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bb=
class
index b2f216f361d..e2000d1c8d3 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -90,16 +90,18 @@ python () {
                 # Since configure will likely touch ${S}, ensure only we l=
ock so one task has access at a time
                 d.appendVarFlag(task, "lockfiles", " ${S}/singletask.lock"=
)
=20
-            for funcname in [task, "base_" + task, "kernel_" + task]:
+        for v in d.keys()
+            cleandirs =3D d.getVarFlag(v, "cleandirs", False)
+            if cleandirs:
                 # We do not want our source to be wiped out, ever (kernel.=
bbclass does this for do_clean)
-                cleandirs =3D oe.recipeutils.split_var_value(d.getVarFlag(=
funcname, 'cleandirs', False) or '')
+                cleandirs =3D oe.recipeutils.split_var_value(cleandirs)
                 setvalue =3D False
                 for cleandir in cleandirs[:]:
                     if oe.path.is_path_parent(externalsrc, d.expand(cleand=
ir)):
                         cleandirs.remove(cleandir)
                         setvalue =3D True
                 if setvalue:
-                    d.setVarFlag(funcname, 'cleandirs', ' '.join(cleandirs=
))
+                    d.setVarFlag(v, 'cleandirs', ' '.join(cleandirs))
=20
         fetch_tasks =3D ['do_fetch', 'do_unpack']
         # If we deltask do_patch, there's no dependency to ensure do_unpac=
k gets run, so add one


This looks simple enough - iterate and remove any problematic cleandirs
references. There are several potential issues. Firstly the performance
of d.keys() with a getVarFlag() call like that is dire. If every recipe
did this the parsing time would be horrible. I don't know how badly it
will affect things for a singdo want to give usersle recipe. We might
be able to have bitbake save a lit of function names into a variable to
have it reduce the performance impact if that became an issue.

Secondly, it still might not catch every cleandirs for various reasons
since they may be set dynamically or in other unusual ways. It is
probably better than what we have today though.

My second idea:

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 20968a50766..bfe9c124ee3 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -165,7 +165,8 @@ python base_do_fetch() {
 addtask unpack after do_fetch
 do_unpack[dirs] =3D "${WORKDIR}do want to give users"
=20
-do_unpack[cleandirs] =3D "${@d.getVar('S') if os.path.normpath(d.getVar('S=
')) !=3D os.path.normpath(d.getVar('WORKDIR')) else os.path.join('${S}', 'p=
atches')}"
+SOURCE_CLEANDIRS =3D "${@d.getVar('S') if os.path.normpath(d.getVar('S')) =
!=3D os.path.normpath(d.getVar('WORKDIR')) else os.path.join('${S}', 'patch=
es')}"
+do_unpack[cleandirs] =3D "${SOURCE_CLEANDIRS}"
=20
 python base_do_unpack() {
     src_uri =3D (d.getVar('SRC_URI') or "").split()
diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bb=
class
index 90792a737b1..f145e0bd1de 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -77,6 +77,8 @@ python () {
         # Dummy value because the default function can't be called with bl=
ank SRC_URI
         d.setVar('SRCPV', '999')
=20
+        d.setVar("SOURCE_CLEANDIRS", "")
+
         if d.getVar('CONFIGUREOPT_DEPTRACK') =3D=3D '--disable-dependency-=
tracking':
             d.setVar('CONFIGUREOPT_DEPTRACK', '')
=20
@@ -90,7 +92,7 @@ python () {
                 # Since configure will likely touch ${S}, ensure only we l=
ock so one task has access at a time
                 d.appendVarFlag(task, "lockfiles", " ${S}/singletask.lock"=
)
=20
-            for funcname in [task, "base_" + task, "kernel_" + task]:
+            for funcname in [task]:
                 # We do not want our source to be wiped out, ever (kernel.=
bbclass does this for do_clean)
                 cleandirs =3D oe.recipeutils.split_var_value(d.getVarFlag(=
funcname, 'cleandirs', False) or '')
                 setvalue =3D False
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 5d2f17c3be2..b7d3bc03955 100644
--- a/meta/classes/kernel.bbclassdo want to give users
+++ b/meta/classes/kernel.bbclass
@@ -172,8 +172,9 @@ inherit ${KERNEL_CLASSES}
 # We need to move these over to STAGING_KERNEL_DIR. We can't just
 # create the symlink in advance as the git fetcher can't cope with
 # the symlink.
-do_unpack[cleandirs] +=3D " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERN=
EL_BUILDDIR}"
-do_clean[cleandirs] +=3D " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERNE=
L_BUILDDIR}"
+SOURCE_CLEANDIRS +=3D "${STAGING_KERNEL_DIR}"
+do_unpack[cleandirs] +=3D "${B} ${STAGING_KERNEL_BUILDDIR}"
+do_clean[cleandirs] +=3D " ${SOURCE_CLEANDIRS} ${B} ${STAGING_KERNEL_BUILD=
DIR}"
 python do_symlink_kernsrc () {
     s =3D d.getVar("S")
     if s[-1] =3D=3D '/':

Which parameterises the places ${S} is placed into cleandirs and clears
than in externalsrc. That should be more reliable in some scenarios but
relies upon it not being added to cleandirs elsewhere. It is probably
more surgical and neater but doesn't remove all the risk. I'm not sure
we can ever give 100% guarantees though.

Cheers,

Richard


