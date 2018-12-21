Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 697EF60190
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2018 09:05:14 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id p86so3365518lfg.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2018 01:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=aL8zVE21gDTPEgEbCdidXUjRnkgAMws2aB4sAg5rpzM=;
	b=CslpdCe52yzBv95MCsEh5uLywMnht1QWdV3AnoU6ZwHtYHgnma43VgAKtfnbE9g+7k
	GkXQw7GLY6n4n9PgZvME7rqNFdzaUymbGn8HHEbvGG2H9eqaip+D+Yf4a6Ax8wRWYZTN
	Vy+X3RYW/8Ojbpre0QrC3/xCD5/Up3aHw/GaPodN/llS2ifpPfObgiRR7SZ8vPYMqzCF
	A1gAkQxAQI3P5aQw/9SN6giiSUwSV+Uo0intWpmwnI2QHJw7cm9UkVUYz3+O+tD01fqt
	j1rycFUXDYnrQyHuzi5qzlaIYgXQ/opawyVxU/XuqavM3Yb801YUXTr6bQ6TIByLdMEg
	mKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=aL8zVE21gDTPEgEbCdidXUjRnkgAMws2aB4sAg5rpzM=;
	b=Sw9hr5VyU13IE2zMIApp3McxRPJoD9m3YKrkc0tJWQQL/rgosjOt8z/+OeyGlKBCYo
	c/xa9C7LDTQoCigjvhg8bU46RUGZePra230YVPvljt/wp7eTZp/Rm76KgyCJXtt3G96B
	3oe4CPBL+x7V5Ou40d9cHgatUpZhMa2sglOkfPXneIGlzS6iYyFQSmsuE1UjboVbN7FU
	ZGbHDZYtWbEiGoxuFx+LoP0xdPZIqDtm5Taz65+pP6Ea5AhTMEcDFsiR29z6cr8zMxA7
	EgdfwtbaSe+VR/awny97gwqRZLJidVcCFYr4kiRNjuy/cBKyOoXPoPBAdBmaezd5hzTX
	QUTQ==
X-Gm-Message-State: AA+aEWa11utvf9KuqOHg4vN85f35eLtvESqYZ8t9jA81hFZHNODYDO6L
	yUzpH7vf5OdlgJgJECNMrFR2n4HH8CA=
X-Google-Smtp-Source: AFSGD/WQrhuc0H7jRjy8izFfIgxUChBVeB83OJ5WFtTll/e2gsyl4b26OdTpHONKIULymZib+iZmmA==
X-Received: by 2002:a19:660a:: with SMTP id a10mr968098lfc.146.1545383114488; 
	Fri, 21 Dec 2018 01:05:14 -0800 (PST)
Received: from skeletor.lan.mikrodidakt.se ([213.185.29.22])
	by smtp.gmail.com with ESMTPSA id
	p89-v6sm2005774ljp.60.2018.12.21.01.05.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Dec 2018 01:05:13 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Dec 2018 10:05:00 +0100
Message-Id: <20181221090500.7699-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] classes/buildhistory: avoid git diff churn by sorting more dictionaries
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
X-List-Received-Date: Fri, 21 Dec 2018 09:05:14 -0000

Sort 'srcrevs' and 'tag_srcrevs' before iterating over them in order
to avoid unnecessary changes in the build history.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/classes/buildhistory.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 40b292b139..d1f3e6aa82 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -896,7 +896,7 @@ def write_latest_srcrev(d, pkghistdir):
             if orig_srcrev != 'INVALID':
                 f.write('# SRCREV = "%s"\n' % orig_srcrev)
             if len(srcrevs) > 1:
-                for name, srcrev in srcrevs.items():
+                for name, srcrev in sorted(srcrevs.items()):
                     orig_srcrev = d.getVar('SRCREV_%s' % name, False)
                     if orig_srcrev:
                         f.write('# SRCREV_%s = "%s"\n' % (name, orig_srcrev))
@@ -904,7 +904,7 @@ def write_latest_srcrev(d, pkghistdir):
             else:
                 f.write('SRCREV = "%s"\n' % next(iter(srcrevs.values())))
             if len(tag_srcrevs) > 0:
-                for name, srcrev in tag_srcrevs.items():
+                for name, srcrev in sorted(tag_srcrevs.items()):
                     f.write('# tag_%s = "%s"\n' % (name, srcrev))
                     if name in old_tag_srcrevs and old_tag_srcrevs[name] != srcrev:
                         pkg = d.getVar('PN')
-- 
2.11.0


