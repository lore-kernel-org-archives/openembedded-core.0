Return-Path: <jpuhlman@mvista.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 42EF878B3D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 19:56:41 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id z24-v6so1964815pfe.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 12:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=tTcK/uriD3gc1INJQLc7k0lh1fATEFkmSAGzjpVY8yM=;
	b=xzhGpim9HFyW/oPaFAGTj49e57uejgOrDvpqZYMnL+M0JuA59kfmzeE92VjNS0LkdG
	eBd7y/7ygN17d6CX+BmSZBatHUfOsEJVWmm1nn+pWFnzO+v4ZOQq2rXthA6MxyAkbbmk
	NjxXalOIZDrRgpsw61iJfl7XutcfeQG4b8jJD69N3AhAvpkGLXHZRhj1NcQpU9TjIG7W
	HYIIgCeAvwp2AaChje/wUq893JjCbwbIv65pxMnwl2k2lRUczkXcr6n/ZDEC0badFcjV
	BvlBTg+HAy3yeOlUZQvl5pSNq4jaYpuwXprFDeez1YnxV8uabyNKL9ArtKYAlb8iyMa3
	w1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tTcK/uriD3gc1INJQLc7k0lh1fATEFkmSAGzjpVY8yM=;
	b=eJkf3sxhKbGJBJqivPssfZOXa/gQuURFj2oAe+Znv35Prah3a1vI09z5NwUomjEBJX
	TOhW8uVPyDm4Yxh3lq50x1D+DY0jcoZ4ulPKCY0bbrlXQ16jIwEjeJH0L4rzyf2CwpGG
	d/9JUdc9VPQ8VrCdn4IAksV4sFxyCkwxX4EwiNOx8uNNTpEZkxno9RQM1sfr1LF17ZoL
	6gp6+pv0g5aevItdgRMLeMfkVd2kpDzuIsf5d6Nrq0z2SHLhI6bzbU20+of6X0aKnIna
	tlM5tavbnZ7/MaGwKc3/z8540sPT+y5gmaa45q93XBB037hyqJXWOMPbVB5henQD0uAO
	kBKQ==
X-Gm-Message-State: APt69E1wIswHyu1o+AqjfkOK5uhUeSp3Y2H6MkMMTcGQ14966EJRl7lP
	9FWCKLNcXq7rOQdl6oaft2fGpEinUPo=
X-Google-Smtp-Source: ADUXVKK41bQ8YJjBN6cZoUX5/4bDRGIe37NgctwuPqXhatOzvVQkXxVF2rMD3DoRilfUKDbuj5fUgQ==
X-Received: by 2002:a63:ab45:: with SMTP id k5-v6mr5282119pgp.23.1528919802312;
	Wed, 13 Jun 2018 12:56:42 -0700 (PDT)
Received: from jptest02.mvista.com (64.2.3.196.ptr.us.xo.net. [64.2.3.196])
	by smtp.gmail.com with ESMTPSA id
	m16-v6sm3873805pgu.67.2018.06.13.12.56.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jun 2018 12:56:41 -0700 (PDT)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jun 2018 12:53:43 -0700
Message-Id: <20180613195343.16335-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.14.1.459.g238e487
Subject: [PATCH master, sumo, rocko] Multilibize the UPDATERCPN variable
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
X-List-Received-Date: Wed, 13 Jun 2018 19:56:41 -0000

The audit package specifies the following:
UPDATERCPN = "auditd"

However because it is not multilibized, the value "auditd" is used to
search for the package to add the post install script too. In the mutlilib
alternate abi case, that package does not exist. It ends up assigning
the post install script to the lib32-audit-lic package, which
subsequently failes to execute the script due to the initscript it is
trying to turn on is not installed.

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 meta/classes/multilib.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 5f9dc311f4..1dcd350298 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -115,6 +115,7 @@ python __anonymous () {
     clsextend.map_variable("INITSCRIPT_PACKAGES")
     clsextend.map_variable("USERADD_PACKAGES")
     clsextend.map_variable("SYSTEMD_PACKAGES")
+    clsextend.map_variable("UPDATERCPN")
 }
 
 PACKAGEFUNCS_append = " do_package_qa_multilib"
-- 
2.14.1.459.g238e487


