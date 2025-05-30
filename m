Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 416B1C5B543
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 13:11:36 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.2338.1748595632572998801
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 02:00:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@salwatorska.pl header.s=google header.b=ewRvzEdz;
 spf=pass (domain: salwatorska.pl, ip: 209.85.218.54, mailfrom: marcin.bajer@salwatorska.pl)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad55d6aeb07so278747066b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 02:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=salwatorska.pl; s=google; t=1748595630; x=1749200430; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lhurWsfxHph1mL+gss+TZvZmgw+ES2d7jGupwpMm2+8=;
        b=ewRvzEdzrozhBz8r6rQp109zlqtPccQRv1ZrTE653wISwweNt8tU2m6vFt+xeYu8RV
         ntZGv5ayVdgZdWoXIPHiBlzP+6Yens2jbKRuJjH52+DEm3R5lvUqu5cWFQqMA0NONiRO
         9Ymn78UpHolfdMvDXl3B13sE6LYedU8ZLO6IuFe2CRU2ouLeBAIis3lsM7oAeCeF4LRN
         GcJkoaToW3sdRtI/OJ967M1vFiH4X1zapNzjvF+22nukGnFTalDX69XoEXH5gJatVPkL
         bq5J4kji3EumBImEijVTbnAQxa7Xsm70Q48MdGQwJw5kPE25uqQWqhvOoKLGb2i7xcV3
         YVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748595630; x=1749200430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lhurWsfxHph1mL+gss+TZvZmgw+ES2d7jGupwpMm2+8=;
        b=ucr28rTVpQTRUYXmYnPpemVn8s4pFEnVSny6y8bR78DFgZjzBVBnRi5vgL+8cM/xTM
         8oKAoBBJDhSQd7oQzPbBLSH3hrPHcqQ46aokAs4D/gOqpdfbTb7Fllv2w50FOiUTyQww
         F6K84WJaaIquEghnRKhLOwgPEhT1BETgiIdWxMtJPVvmT35/79VH+DVm++sIbBJv2G38
         TzK28R+oiY6DKopOtM379igd8WI+WX3Fzd1vyQZUC1A48JTbiogBDLMI1xMEBtnjuxQq
         0rgOV/3IvLH4NOFFu776jiKywmk1TL/INmHIi7SJX2nYKiUakpSPWwKjxenuViWhFKUr
         qhYw==
X-Gm-Message-State: AOJu0YyUbolbUn2J8QZOZRVfCOtzeo0dhOsGEZ/l8s5ANAAMRBjIB+ez
	aywA/2VD7EaBLFsD1bTapERgEiwmQP9vxR8wGMZxx4O/0rN0kcXbzpTBqgQbmRAeC/38ZI7UI5Q
	/jXpn
X-Gm-Gg: ASbGncs14enfvo66SjhOXtGZ/ubXJlMOoiXjN/hakUwCFlBsYYwBiSsdkplKuYb3SY0
	0BGY2mA9taXv0wef/JTu3wPYa1A3VCxnBNchokOCzljHYSY4ZpKWyrvU6gMNyKURKF586/Masp6
	llmIXH/qVfLoV56s74YiOteMco5TGVzEetN8JjExXxuF2gwUIzaD/b/K0Qg0WDspfDAlnzY56U0
	fcM/lqUF+ZfDXS40y1ay8Sai54jYZA+gEFXHTEKqlJ1huSddvPVjaGWaAO7TtUM+Md83XTKBq0U
	iHhaa69zuM3iwzXIZe/SibnUY1gTu9vKVtGx5gBSUCnpUFtCm0llhhnal3j7LKg3+1XDD1EjII7
	IXeSxGB10m64KiR8N/Yk=
X-Google-Smtp-Source: AGHT+IHbVpCmgSzRlfaSGYhFWWmKDQh9BqlsThGE2FS8UEXkG0rROTjp+Gx3a1TEnu/OALkq1pRm9Q==
X-Received: by 2002:a17:907:9450:b0:ad8:9e5b:9217 with SMTP id a640c23a62f3a-adb36bfb683mr121143666b.45.1748595630118;
        Fri, 30 May 2025 02:00:30 -0700 (PDT)
Received: from plmabaj-ThinkPad-P15v-Gen-3.. ([89.171.129.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5dd045edsm284179966b.119.2025.05.30.02.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 02:00:29 -0700 (PDT)
From: Marcin Bajer <marcin.bajer@salwatorska.pl>
To: openembedded-core@lists.openembedded.org
Cc: Marcin Bajer <marcin.bajer@salwatorska.pl>
Subject: [meta-oe][PATCH] signing: export rule specific environment variables with Digicert infrastructure
Date: Fri, 30 May 2025 11:00:19 +0200
Message-Id: <20250530090019.668412-1-marcin.bajer@salwatorska.pl>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 13:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217505

Digicert cloud HSM requires more variables to be exported i.e. `SM_HOST`, `SM_API_KEY`, `SM_CLIENT_CERT_FILE`. The signing provides might inject needed configuration to `meta-signing.env.d` directory in form of *.env files. In exisiting code in `signing_prepare` call source all *.env files from `meta-signing.env.d` this allows to export only variables common for all signing rules. In case, unique settings per signing rule are needed those are overwritten (sourcing next file will overwrite previously defined variables). Proposed patch allows to export signing `rule` specific variables. For example to set SM_API_KEY for rauc rule it is needed to defined in env file as `export SIGNING_PKCS11_SM_API_KEY_rauc_=abcde` . Added logic remove prefix SIGNING_PKCS11_ and surfix _rauc_ end export the variable.
---
 meta-oe/classes/signing.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bbclass
index f52d861b76..cefd115355 100644
--- a/meta-oe/classes/signing.bbclass
+++ b/meta-oe/classes/signing.bbclass
@@ -263,6 +263,12 @@ signing_prepare() {
 signing_prepare[vardeps] += "signing_get_uri signing_get_module"
 
 signing_use_role() {
+
+    #import all variables dedicated to this signing rule    
+    for env in $(ls "${STAGING_DIR_NATIVE}/var/lib/meta-signing.env.d"); do
+        eval $(cat ${STAGING_DIR_NATIVE}/var/lib/meta-signing.env.d/$env | grep "^export SIGNING_PKCS11_.*_${1}_" | sed -e "s/SIGNING_PKCS11_//" -e "s/_${1}_//" )
+    done
+    
     local role="${1}"
 
     export PKCS11_MODULE_PATH="$(signing_get_module $role)"
-- 
2.34.1


