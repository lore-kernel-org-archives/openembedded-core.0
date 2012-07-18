Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrUhe-0004qc-39
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 15:54:10 +0200
Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 18 Jul 2012 06:42:47 -0700
Received: by wibhr14 with SMTP id hr14so1158694wib.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 06:42:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=JK5rqIEg7IklBffP6x7YHZqM706v9jlzJBZHgBLwIpY=;
	b=IdZezf1WUaRbpbr0wSTG7wrmjWmG7UD0oyPdQXTXtnjGgTPjhLBm5KvrsyeXAyK1iC
	HfCD07rn8ZhvnSzE4NDB45jOTRCvFjkUPf5Ip/bI06XCEuO4qtAs1M8myud7mhsuwQC+
	PsfXjwPJ/UOvCyT313/xWD8/5EijsUgx4uICg9xU+Zm2o4Ur6xvkgKdD9RtSykQNM+dK
	ZZ2qv4XDL78o7JG1rjwv+fU0K0z6wOMGspPNP5/zO1bfTSwX6Bf5SEczYIsMeVO1kKYH
	JSD3lIfsgFP9S0bOd3RkAToHqK0epGx+EncMYwtki/ewyDD9SpSodiaIWqwBsdHh9NCa
	h60A==
Received: by 10.217.6.194 with SMTP id y44mr622558wes.27.1342618966077;
	Wed, 18 Jul 2012 06:42:46 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id ef5sm48387363wib.3.2012.07.18.06.42.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jul 2012 06:42:45 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jul 2012 14:42:30 +0100
Message-Id: <1342618950-1081-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmLBpL7z82e6v26Gcg3Aysn9C/HN9PdBfY+auDlhbGYz3OmR7zgqv/CDoZ7ttuuGNTU4o5g
Subject: [PATCH] sanity: display the parsed PATH when complaining about CWD elements
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jul 2012 13:54:10 -0000

Many people don't understand the nuances of PATH, so help them by clarifying
the warning and displaying the parsed PATH element-by-element.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/sanity.bbclass |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 765958e..5c69d54 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -390,7 +390,8 @@ def check_sanity(sanity_data):
 
     paths = sanity_data.getVar('PATH', True).split(":")
     if "." in paths or "" in paths:
-        messages = messages + "PATH contains '.' or '', which will break the build, please remove this."
+        messages = messages + "PATH contains '.' or '' (empty element), which will break the build, please remove this.\n"
+        messages = messages + "Parsed PATH is " + str(paths) + "\n"
 
     bbpaths = sanity_data.getVar('BBPATH', True).split(":")
     if "." in bbpaths or "" in bbpaths:
-- 
1.7.10



