Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6AD6478A4F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2018 09:44:01 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id s14-v6so5046022wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jul 2018 02:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=7Ah2uoTQcOMEtpK4c+b3SG7UIQANRRcXyXdI6dymh8U=;
	b=VZRQS02Cb/DLTZPHqQXfGW1py/11z78QQ+dIw9Ojki8iFVVJ2wesLA9fidjJ+JGdEV
	DxApSLMGyj5Nw5vkSQBYKWug2l2yl1Aei5OG/6aRAnLhimDJa00j2npCxEfQLU11Gp8o
	NK+7CfZNCpPD13E45slW9lUKByKizY5liJUVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=7Ah2uoTQcOMEtpK4c+b3SG7UIQANRRcXyXdI6dymh8U=;
	b=RG7EAFGSoUifVwq2HI4A0edB91ICqfxdE1gcYxrfVBoYPks2Df4I16pX8SpkFRjlJd
	CfqqntKjm42YR5gCXIRS2IpfT/xb+tuZRw+0BQL3oiIXfTzeEGfYtFw6vFhvgmaQ1pId
	Ig0UmUK/rOaWRQkRRz3tfsCqRpA+IGJ6y9SpN9gjmRlpVNiUz9ErdsxQRg5rbuDpZ7Gs
	PczIQOwoyCQAOiNa05NM3rh5onKQXyRM/bcXo06O71d2/21So+Hwwdja7xMt9aluxiq4
	ImCU6xvrL3DbJ2yBDC29a5eNTDuiAK8pvXSZWV4Eu5eATaoQZg70HnNWABYM7mxfwm/j
	1KUA==
X-Gm-Message-State: APt69E3BYYQXkG5n6kroYL2iQFg/LZPn0tumu4lZJDMVr5SGJ+LglagF
	Jpq6yC+1E6DbTNKOv5L0Yr3pJ8IddBI=
X-Google-Smtp-Source: AAOMgpcMZnum0wqm79s3oNryMsyVJjSfWG9+6AqPXUDj+F6FSpmtP7480+LKYfHcBdEpQN0WOvD25A==
X-Received: by 2002:a1c:2094:: with SMTP id
	g142-v6mr1029908wmg.144.1530697442098; 
	Wed, 04 Jul 2018 02:44:02 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o17-v6sm2855303wrp.62.2018.07.04.02.44.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jul 2018 02:44:01 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jul 2018 10:43:59 +0100
Message-Id: <20180704094400.9746-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] send-error-report: Fix dubious error reporting
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
X-List-Received-Date: Wed, 04 Jul 2018 09:44:02 -0000

Currently this code prints things like:

ERROR: OK

which is unhelpful at best. After this change it would print:

ERROR: HTTP Error 500

which at least gives us something to work on.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/send-error-report | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/send-error-report b/scripts/send-error-report
index cd2e7f4b9db..02014ba9d85 100755
--- a/scripts/send-error-report
+++ b/scripts/send-error-report
@@ -140,7 +140,7 @@ def send_data(data, args):
     try:
         response = urllib.request.urlopen(req)
     except urllib.error.HTTPError as e:
-        logging.error(e.reason)
+        logging.error(str(e))
         sys.exit(1)
 
     print(response.read().decode('utf-8'))
-- 
2.17.1


