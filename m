Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0251C35FF8
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:13:02 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.31806.1742141577401987279
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:12:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DTqtpfVn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf848528aso11264245e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141575; x=1742746375; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bNLuMyRmYZzTHPkauHPysqaPZSxekAHy8J1pQWbSdnA=;
        b=DTqtpfVnEz/os52oFCSBagrEGBCxTXwxtsCN3MeEGh864/74/BlXBYIBYp/nx/i+ol
         KPvCjbyOCFzXnvITfGipX9r5SSgLQ+njKwGIeiahOes9os+kQbqCEl5JMjIkPoPIs9i/
         NmAasCUaNQVlTWVqeSC8Q04sYAMVsbszL94lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141575; x=1742746375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bNLuMyRmYZzTHPkauHPysqaPZSxekAHy8J1pQWbSdnA=;
        b=bd8bN4Fm4jvtKR2vY98tdJyBkInUiJjH3TZqfoHVxgRYJV4AuHqPThR3IO4827ujHn
         F+d52YKPj0gSSylvTuT23715NmjjtrwKh2qs7CWN/YdJXrjfiPlP6NYvwJdaMH4NIPQY
         3/sv91h0E88a+sW+cWIqjXxb0LXO8U5Tey0XFw8krlr5hlb9kxvyCLkSUxO+4esoSyRN
         Rq8LCAF/g92wQ0KcFfrBvYhTBOeoQadeEoReLlSFjge6/vAMJTzfYcU3mv77P2rYE2sm
         piV8OOt3kKdfOF9AO4qst+PqFUxpClUxUuFE20roa1VYHIoSgBY6WsV8H6CR2hr7uGo+
         E+GQ==
X-Gm-Message-State: AOJu0YxrQ+tD5tnd4X+ClaRHOxRLrN5RkLENUQ1LwVrMsSjzuiWZKuy2
	m4mXCzEeDTDQeS6pXZmC2pxqvZMLGTBxPfBQYCp7HonkoU6WzHHNOabRuGUG9H2mbmX1DNzIdsC
	m
X-Gm-Gg: ASbGncveETiUHsbHqdpXCKEWjw7uBKz2hlQK6j0skZR6NpUd+FhJrjdmMNgYbjM8oTn
	yfqXlgE+mnkW0/411lFH6ExIEI6vOcRvHP5M2p7RM2neakrEZtNLXiaPVAgsLBNIXx7bRJ2PM+3
	FXEqbrTXhWKlbSUdtPQN+ZdQEOmOckmYmKGwS3F3OsBW5H9GJ2yHMK4Y9rAeshsLRpSl5o+uCPs
	0EzzZyAg7CIaDPI7kQtFhPuhZM96q9/UFK7NtDalUYAevupRvZnlUo84kMPuj1kN0vI2h/QWaUb
	T6Nazp9eAPzLoYfrW4oetq5MO69uKpodqbLYlHg0ZXE0rFlfVyY1L6w4A9MS+Zhxz5RXk31z4lU
	yL3eBJA9C
X-Google-Smtp-Source: AGHT+IF0wm10AiVj5SzaWqzfPkyIyw/+bw5Km/Sbhvcbh1lgUi+oCr4AZ/1tlFEEQ3pHYvxmMWmy2Q==
X-Received: by 2002:a05:600c:5486:b0:439:9e13:2dd7 with SMTP id 5b1f17b1804b1-43d1ec7251bmr99066165e9.2.1742141575428;
        Sun, 16 Mar 2025 09:12:55 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.12.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:12:54 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 31/43] sysklogd: upgrade 2.7.0 -> 2.7.1
Date: Sun, 16 Mar 2025 16:11:57 +0000
Message-ID: <20250316161209.3629986-31-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:13:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213034

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../sysklogd/{sysklogd_2.7.0.bb => sysklogd_2.7.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysklogd/{sysklogd_2.7.0.bb => sysklogd_2.7.1.bb} (97%)

diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.7.0.bb b/meta/recipes-extended/sysklogd/sysklogd_2.7.1.bb
similarity index 97%
rename from meta/recipes-extended/sysklogd/sysklogd_2.7.0.bb
rename to meta/recipes-extended/sysklogd/sysklogd_2.7.1.bb
index af8abb56b42..b7e32542772 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.7.0.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.7.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/troglobit/sysklogd.git;branch=master;protocol=https
            file://sysklogd \
            "
 
-SRCREV = "b45eb487b96935c72fc997d840f82ecf650ed8a5"
+SRCREV = "5552a3ea0d025573a5e212d62ee3e04bd376c7c4"
 
 S = "${WORKDIR}/git"
 

