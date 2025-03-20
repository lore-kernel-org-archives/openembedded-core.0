Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02AA8C28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 13:50:09 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.7889.1742478607566521600
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 06:50:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XsfDVU7W;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3913d129c1aso577926f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 06:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742478605; x=1743083405; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LMneZMSwETBMJpTZ5mNiLXJVQcxAufg4Y7azpYySJyA=;
        b=XsfDVU7WOwxOcmt0QZNCECwQgO3+WpoCcF4FYg30PqdZIwJwhp0FVNwlhUdhR54h5/
         A0b8lrgVkNum/kRmyHP09r1ztzbsiXkEreTLkrTCb8/DoxZ3fS05G0W2FA4n0LYtZWl6
         2fV5htO2OEd3wrZNI93wx9g2uez6TNqjLq1EE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742478605; x=1743083405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LMneZMSwETBMJpTZ5mNiLXJVQcxAufg4Y7azpYySJyA=;
        b=IUeDnFfV8rZT/PAjNvB0enYXrOprAFoRioB1X56FDNE2ZXWB1/CRCKbRngtZD0BlE+
         m90AX3nSPyN1sTwxCeJ6b28WhFyjoXjPQ0im5yVzO1pKHosHGmgxVQlzw07zPr17ECz1
         bF08yDQgTBqA6becZM1SU9AW5YydtEF16/1APyYLY5HUQsXgJ5cliqXXgIDaG0qbM/Vz
         nedZvyQkz3E78cXk2M95Dx+UfE0qNChSzpI6fiwKsVvdT5ZmmuBqPRaVFodk/w+bk8L/
         yFh2cK+F9S4npNM02ZjjexUJoSTUhSx3YworcOkJ8iBU1J5YxRIRNsv/f5s5dgLSO/r7
         nSAw==
X-Gm-Message-State: AOJu0YyvCinMjjotsb8az92pc7f0B5gOzbikHIxGbYcv2YUy6WcUdqti
	hkH/Ayzkr7ExxIRfzbV32llUcZpzMHu3f/0u8UcdTYTKEoSl90up46FnFenIAcqew5IP/2neday
	x
X-Gm-Gg: ASbGncv1YT6Z4TlLgn09cz+87V/w3xRp73vB+2mSjivDKho44hnfHjB8ynphNZ4PpxE
	EeDUKz6q8L9sAQJxa7Th3FKmLZrzawlQyAC/05rR9WJtxxCnVzYT+0bGV3wQToI22Ehaxg6r711
	OIrcBed1cQfgN78KRTBYIPDwC+F99rtZrwiiu9BmMf+KzCEZy85emtkF4faBPHOoZsQbDmDNAAL
	j8g1VT4jkjyNDsFkUCODjN3MLf0kzVhaRuTuuBc+VRC7HT08MnFpTqZcbv37QR8QY9w7r0uMFbo
	w+aJEuu1bAE+1ZOSrWObx+Q1vobK08d0ZWOom1pQLw7e5/wuI3G1FrskxXKXXQ7sotadLIqIcA=
	=
X-Google-Smtp-Source: AGHT+IGz5UVRp392u4AEylWsgWyYErLA6OOxiBG1NEifaDGYOgx7Hd2nBXe2QtsfEtn741dN1wPQ9A==
X-Received: by 2002:a05:6000:178b:b0:391:2889:ade0 with SMTP id ffacd0b85a97d-3997957c992mr3431251f8f.18.1742478605474;
        Thu, 20 Mar 2025 06:50:05 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ede9:63ed:996d:ca84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c7df35f7sm24111131f8f.13.2025.03.20.06.50.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 06:50:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] buildhistory: Update for bitbake changes
Date: Thu, 20 Mar 2025 13:50:02 +0000
Message-ID: <20250320135002.948979-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250320135002.948979-1-richard.purdie@linuxfoundation.org>
References: <20250320135002.948979-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 13:50:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213399

Bitbake is dropping the need for fetcher name iteration and multiple revisions
per url. Update the code to match (removal of the for loop).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/buildhistory.bbclass | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 817c570b36f..ed8d5b98c20 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -942,13 +942,12 @@ def _get_srcrev_values(d):
     dict_tag_srcrevs = {}
     for scm in scms:
         ud = urldata[scm]
-        for name in ud.names:
-            autoinc, rev = ud.method.sortable_revision(ud, d, name)
-            dict_srcrevs[name] = rev
-            if 'tag' in ud.parm:
-                tag = ud.parm['tag'];
-                key = name+'_'+tag
-                dict_tag_srcrevs[key] = rev
+        autoinc, rev = ud.method.sortable_revision(ud, d, ud.name)
+        dict_srcrevs[ud.name] = rev
+        if 'tag' in ud.parm:
+            tag = ud.parm['tag'];
+            key = ud.name+'_'+tag
+            dict_tag_srcrevs[key] = rev
     return (dict_srcrevs, dict_tag_srcrevs)
 
 do_fetch[postfuncs] += "write_srcrev"

