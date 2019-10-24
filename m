Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 44EC97F99C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 13:03:45 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id v9so14717362wrq.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 06:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pCOmBEbn9Wd8SqIB3BpjlY/ummUPGApgO9XwBRURvdg=;
	b=VLHB1oPpIrUT1fity7R5SmX1Lv1C5rNbqMnOdEAj5BSPGTMAK2lWUZPQEDfOE7deRE
	IOrVIpYcM/NeO8MwDzsNs2e5yQfXDK5es7b5h4JOatYhPPZz9r/pFmmXjvKW1PmgdPTI
	tZouoZ++Lf9Tx/pYu1ZwyAi4pwb53RLMKH76g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pCOmBEbn9Wd8SqIB3BpjlY/ummUPGApgO9XwBRURvdg=;
	b=HJow0gQWN9aVZpwyYNo8Klbj9izepDmnUHkdJ4fU/POoQ6EWO5ZN5SRNo/vACfUogE
	ZNX6xL2mtMq2xPsJvWRC++veouDlwInde+xl0nUgGtG0d9drtUKOjN+Y4EVMVGfO2y73
	49oZuQZSNi9ImQNj3WZEUFyQtnaNDzsQLu1BlF3Vltdv2zigFqtNBFvvpXFOBSGdo+ye
	341hh6jUCRfmB86DUJCHmPobXaJBSbtBnhngSGt5spBQINPAL83YjR0WyPmY0ghMr8vz
	YvInAYRvjAEM7Nkht2dnMfGeugG+hi8QJ24LN3i/eYUj3eG5DrlPEw4bAF6UhVW/mLrJ
	+ltw==
X-Gm-Message-State: APjAAAWuHvrI9vqAr7fbmlqmUvx/0wwdw+/BdiocMzW+U4JFdmA99CY6
	H6JZUh5E4PMDfFj9/thUnNpAp7FcFBE=
X-Google-Smtp-Source: APXvYqwvm4mx+PG2a+tDwOuQwGbe+vWh7u0e6RihtLxZu8Ka1NM5Cdcf1lkRqeY0Yv4GtIVrmXY5vg==
X-Received: by 2002:adf:92e7:: with SMTP id 94mr4018257wrn.199.1571922225254; 
	Thu, 24 Oct 2019 06:03:45 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p10sm27463632wrx.2.2019.10.24.06.03.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 24 Oct 2019 06:03:44 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Oct 2019 14:03:43 +0100
Message-Id: <20191024130343.23292-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] nfs-utils: Improve handling when no exported fileysystems
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
X-List-Received-Date: Thu, 24 Oct 2019 13:03:45 -0000
Content-Transfer-Encoding: 8bit

Ensure /etc/exports exists and is readable before calling exportfs
to avoid errors.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
index d5e9c38a9c0..0f5747cc6db 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
@@ -107,7 +107,7 @@ stop_nfsd(){
 #FIXME: need to create the /var/lib/nfs/... directories
 case "$1" in
   start)
-	exportfs -r
+	test -r /etc/exports && exportfs -r
 	start_nfsd "$NFS_SERVERS"
 	start_mountd
 	test -r /etc/exports && exportfs -a;;
-- 
2.20.1


