Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 27973787C0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 16:56:40 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id d8so3045409qtm.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 08:56:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=pnejBcsZn96fUHe37uldp7e4Dc0h20aXEEsl5p4k0GA=;
	b=ii1punvh0dlogoQ7IaT4vTlaSYaZffnf0j6iZv5vpD7Uo0oekVAMROCFZPKOoW+khW
	DhFXX0Qrfla7FGZfOmWLRRY36Yk+dDAme6O+OqBEU/fSIyBksEezW5hBqrCFav8/Nt/U
	0MTFjg84XOpq2AZKhdo7z8uhMAUdgzradR4Ji7hiJlnFvAfqXt0lVLln3QTrPkKUVjim
	ntcHd1kqdqYP1AqjYfsywrXZjUi5L3o73blySaCFveyGTg52wxYP8urYA94TIwgQDAth
	p/4Yu/5iIUazFALN5KdrzkD04nX8JIt5HKwZLckkmkCQwt3IfdjJkctq2UwYWJfiiA1M
	r0qA==
X-Gm-Message-State: AKwxyte9zpxGd6I/lCaubOPmmdvy2usdUaR+itMrfNw1Ajf5t4JfBRJl
	JlOuKBLa1O0ljvasn1NwXY0Dkg==
X-Google-Smtp-Source: AH8x2245OVNR33bNZlfgPG09lyJQ38MUe8kJ5yliz2jvlsRw7o10aK48wW8Nqr0S8OSvMmhpWndanA==
X-Received: by 10.200.29.2 with SMTP id d2mr4423830qtl.246.1516726601982;
	Tue, 23 Jan 2018 08:56:41 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	u79sm12225202qkl.45.2018.01.23.08.56.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 23 Jan 2018 08:56:41 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 23 Jan 2018 14:56:34 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Jan 2018 14:56:18 -0200
Message-Id: <20180123165625.7352-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180123165625.7352-1-otavio@ossystems.com.br>
References: <20180123165625.7352-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [rocko-backport PATCH 1/8] uninative.bbclass: Fix broken symlink issue
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
X-List-Received-Date: Tue, 23 Jan 2018 16:56:41 -0000

From: Mark Hatle <mark.hatle@windriver.com>

If two builds are sharing the same DL_DIR, and the uninative file is local
to a layer.  When the first build gets to uninative it creates the link local
to itself, and subsequent users can use the same link.  However if that first
build then is deleted from the disk, the symlink is no longer valid (broken).

We need to update the system to detect this case, and use the model
implemented by the bitbke fetch2 code.  Look for a broken link, remove it,
then try to create the link and ignore an exception if it already exists
(since we just unlinked any bad one).

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bfd9664edad7044b5da53fc33b8d0f6508f00950)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/classes/uninative.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index a410647328..670efa9f05 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -63,7 +63,19 @@ python uninative_event_fetchloader() {
             fetcher.download()
             localpath = fetcher.localpath(srcuri)
             if localpath != tarballpath and os.path.exists(localpath) and not os.path.exists(tarballpath):
+                # Follow the symlink behavior from the bitbake fetch2.
+                # This will cover the case where an existing symlink is broken
+                # as well as if there are two processes trying to create it
+                # at the same time.
+                if os.path.islink(tarballpath):
+                    # Broken symbolic link
+                    os.unlink(tarballpath)
+
+                # Deal with two processes trying to make symlink at once
+                try:
                     os.symlink(localpath, tarballpath)
+                except FileExistsError:
+                    pass
 
         cmd = d.expand("\
 mkdir -p ${UNINATIVE_STAGING_DIR}-uninative; \
-- 
2.16.1


