Return-Path: <wbourque@gmail.com>
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
	[209.85.210.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0E1027C49B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 20:01:00 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id n8so281871otl.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 12:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=PYIgW0f8kzAnl50DSR1e4yLWvZjyWWkD6Mo7s811YHc=;
	b=JsPoCWCsNrQTzhY1zh4V11edPq0anYm0HTyhjh6THVWFP7IP/b3eMRnZ9iVfX0AxuQ
	gOWa5x2RyPYVJAzGxtvwXtai+fIGUd6rkePvc6dEooUEp1efJ4duai1R0W8c1fhPYPrl
	/66RPPKbCV6nkzk4mkDaAT4PZRDW/kPTIfkvMQ0mbqNRR1dROk4f2akV1EGlvPO0pMQZ
	qZwLZ8mRHHwVODHVdI2iixZ1cQYXqtYlMXPiiBRCEa1lpAjKyb5WA8uO428OUld2J0w7
	rKgRiH31rkWWBWpFEJXKBfWrqSlLaRay1+iEFt4QdyGaG3EDcGtlvNSFyPEiDe+WDm6e
	89yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=PYIgW0f8kzAnl50DSR1e4yLWvZjyWWkD6Mo7s811YHc=;
	b=RzIV1BgZEGUEcj7+CA4FTcNk3dIiBKfnkuPejgiD+LXIsGZE8Xv26p+hwjMbon5ho4
	U9AN6etc1AzsuYjs7C6kmfIHNpsiE61N3vQ2IwoL9Djindl0muaZ/Z8aNKCSQyeIlFoj
	sZwxszxLVY94hKwYdhNPL5Bg66nZxTwVZrZyvfFHk598VTVBxWkqN/MnzNgrhQ4SeYA2
	HQkgjmc0JsZirRpT6GrXDDqNEi7GahWRpbM1a7HILCEK+DIhL+Zqgr/jNS60iItJHIef
	VeDJWxxX0sWAYyyHP5TEsQ3w9bcU4P0EeCW8gqtcYO2eWL3q2ZUEFlVtx+eADEzGfK+x
	bzdA==
X-Gm-Message-State: AHQUAuZfoiRFy6kmHPUWZCkGbgRPh7ifWJ+IjaRxJZz7DqKgqs+zV2CR
	DVDv0vkPwh21tIEZ92A+jqqYh3h85SlhXoLO2YDahUisjZ0=
X-Google-Smtp-Source: AHgI3IbAwu3Weoxv0mVE5pD1dX04ApmPDMln4lXf+hscwVSEA82pvEaxrGQsI4BhxuCdZZQRypmRsJu3z/PHBOQd7E8=
X-Received: by 2002:a9d:5d03:: with SMTP id b3mr29032444oti.220.1549915261992; 
	Mon, 11 Feb 2019 12:01:01 -0800 (PST)
MIME-Version: 1.0
From: William Bourque <wbourque@gmail.com>
Date: Mon, 11 Feb 2019 15:00:51 -0500
Message-ID: <CANBSh+OySyKjCYzbOnuJXq4fV74E2QKx9ebAsWZOab_ceoevHw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] wic/engine.py: Use printf instead of echo
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
X-List-Received-Date: Mon, 11 Feb 2019 20:01:01 -0000
Content-Type: text/plain; charset="UTF-8"

Some distributions default shell (ex: /bin/dash)
does not support "-e" argument to echo.
Hence, using "printf" is safer as it, unlike echo,
always inteprets \n correctly.

Signed-off-by: William Bourque <wbourque@gmail.com>
---
 scripts/lib/wic/engine.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 880e464..189253a 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -336,7 +336,7 @@ class Disk:
     def copy(self, src, pnum, path):
         """Copy partition image into wic image."""
         if self.partitions[pnum].fstype.startswith('ext'):
-            cmd = "echo -e 'cd {}\nwrite {} {}' | {} -w {}".\
+            cmd = "printf 'cd {}\nwrite {} {}' | {} -w {}".\
                       format(path, src, os.path.basename(src),
                              self.debugfs, self._get_part_image(pnum))
         else: # fat
-- 
2.7.4

