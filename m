Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1DCEC369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 14:27:14 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.13956.1745497696583601284
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 05:28:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nJe8VTeZ;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: ines.kchelfi@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43edb40f357so6318075e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 05:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1745497695; x=1746102495; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C0itxcRpp9m87bwxsFZZA8UkSVWrpPJ/mOODE2HtzX4=;
        b=nJe8VTeZFX19ZGhoOpokDYAahB8Xy4iZWiBMe89OeT6JC6Jv7/2OmHEqGfishJ/kxH
         l626pk+lXVnoCf4DmOFnkFh8HSa7yvBBwqJkqJFH5+ocpwNYwekVWnZhKI7SonLwdtz1
         SvPHRzJsY08NLWQqGusMExqQA3Ckik/dyTd3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745497695; x=1746102495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0itxcRpp9m87bwxsFZZA8UkSVWrpPJ/mOODE2HtzX4=;
        b=ZWnmsUY9IYps1igictL2kwuMDALLSEmvMnC5Irgl79lbn40tdIzrMlfjjDtRor6Xhp
         uMHQLlvlw1QxcJE5Kyx0Mo9WIF4wFM4Ag8gcNAkuX/0QuXWSicHDG0nXC4TotcotMueW
         aEMAXD2hNFYU9vnS/VvB9ADsU2vjkAYZOtnwfpD7DF1ieEUNI00NSAemB/n/JEtHeh2f
         6ydyeIun8By4e79+zMt+UiCP7tkMDGFKgM1n6SbVecHvy5DJyXkG7t2UXr605JHErY7s
         8YcLEs9Prfw/Oj4F7uKnnVqEOcImX+zz35wjUs1EwzDycp5MAHVs6o0vHQAX9z6G071I
         rSPQ==
X-Gm-Message-State: AOJu0YwJgiGfh0gGt6vjTXrTYI4/bzkh1sBjqLXy60fbp7KymD3nqr8W
	PlOG7bRAo8Ulxp+UFXLAQ8LO8ew0kHqpIrU4IsWA57dnTb4FaSoC7RfbL9Sye+C3UZuyY5LYRp0
	N
X-Gm-Gg: ASbGncunDHnM+IXQwnh/xgAtwW8J55VoEqPGiCET44mQI7umd5LB9eXgpnFANcUdrfm
	j03XDKMun8NieBB82AUpF/MgC+bppaquWKu5Mz7sIg+KN64Exp/8MV55WEvxmY53KfzGQdo3NOx
	1IqdfeRr8ndGzQ9c5lSxj3fVYJroB7eTNSjm72+k6FOioBVEpo5WIghSu/dRDZstbr/Q/Dx/FdN
	jo3h7sC/fi5caPM48FizJ31RpqgxCeSgWSMDzQfLt4kQrURCf8NZTKXXPRvTcefSPSwUdRVv4om
	57+stWHtxScSjlRUuYL/H/bgDPacJDNagGSL69NCpjakLgUEb2jfBYkIEswx/F9zqaUPzVirC1J
	RWIRP8hK/sv1Qaqlh/N7CCnl5QoltnIRjXHWjOu6nV8grtfY=
X-Google-Smtp-Source: AGHT+IE1RD1gySpkhNe8Ei2cNQhx9CXETTVWsWPRaQIpKdME2wSTO4JpvtmbeAfaJa7aIQHo28a0dQ==
X-Received: by 2002:a05:600c:c092:b0:43c:e2dd:98ea with SMTP id 5b1f17b1804b1-4409c3b1e1amr20061235e9.22.1745497694696;
        Thu, 24 Apr 2025 05:28:14 -0700 (PDT)
Received: from FRSMI24-WIZAR.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d29bfa6sm19546445e9.3.2025.04.24.05.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 05:28:14 -0700 (PDT)
From: ines.kchelfi@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Yoann CONGAL <yoann.congal@smile.fr>
Subject: [PATCH 1/2] CI: Remove useless "upstream" check
Date: Thu, 24 Apr 2025 14:28:13 +0200
Message-ID: <20250424122815.884740-1-ines.kchelfi@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 14:27:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215374

From: Yoann CONGAL <yoann.congal@smile.fr>

---
 repos_list.sh | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/repos_list.sh b/repos_list.sh
index 03c1f49..0f6eb78 100644
--- a/repos_list.sh
+++ b/repos_list.sh
@@ -130,12 +130,6 @@ update_layers_to_mr(){
 			if [ "${mr_project}" == "${repos_smile_git_sub_project[${layer_i}]}" ] ; then
 				local_layer_path="$(get_layer_path "${layer_i}" "${cooker_menu}")"
 				switch_to_mr_ref "${local_layer_path}" "${mr_ref}"
-				## control MR_REF is upstream to MR target
-				is_mr_base_parent="$(git -C "${git_local_path}" merge-base --is-ancestor origin/"${MR_TARGET_BRANCH}" "${MR_COMMIT_SHA}" ; echo $?)"
-				if [ "${is_mr_base_parent}" != 0 ] ; then
-					printf "MR is not properly upstream\n"
-					exit 2
-				fi
 			fi
 		fi
 	done
-- 
2.43.0


