Received: from mail-wi0-f170.google.com ([209.85.212.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U6LKI-0003Ci-TI
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Feb 2013 14:27:44 +0100
Received: by mail-wi0-f170.google.com with SMTP id hm11so1305953wib.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2013 05:11:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=QNQXwzGD6udICc6lViMR8IMazwnyJrHU6sIVf9jk4do=;
	b=khKE8HOWRNmtTbnZvK0rcsM9jA1hMJwIVp59/5z2AxvGWl6GMUwbivwOQr39lsvr80
	aoJNB6sqrtzjpEQUEe7D0Fh+i+YzuicbImitshKD37YmhPtUEp0SzdOx7wDFm16HYPLN
	ZaiGxi5vPI85D++DgKAvtfo9lSHacmWRwiKS4h91B8et3zK7wAb6LuqFMwH/b6ZGxFHU
	PraXdW1nAwfQXDJkc4fljLVwQIigsc2jhhFE2GybF23am4k6rXar1sM1zIRvDnL4UeoO
	XOPzdYAJlE+PT6yk3Puxu2juzrtjd12hhMirXi4HehqbETTm0YjfWRfYh0hKvPWrHbTg
	MjcQ==
X-Received: by 10.194.63.109 with SMTP id f13mr4221089wjs.11.1360933899093;
	Fri, 15 Feb 2013 05:11:39 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id j4sm2923857wiz.10.2013.02.15.05.11.37
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 15 Feb 2013 05:11:38 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Feb 2013 13:09:18 +0000
Message-Id: <d074daae51bfced066e25049f41f35aea18f7b48.1360933659.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360933659.git.ross.burton@intel.com>
References: <cover.1360933659.git.ross.burton@intel.com>
In-Reply-To: <cover.1360933659.git.ross.burton@intel.com>
References: <cover.1360933659.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmhWtJYGVBn1jz60EiuGotggTIgIzbntPOMqp6Oy0k9RBCJAyTv7aTFlqqXvFGcqiKQ/PxN
Subject: [PATCH 1/4] package_ipk: check CONFFILES exist before adding them to metadata
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Feb 2013 13:27:47 -0000

opkg-build verifies that conffiles exist, so verify that the specified files
actually exist before writing them to conffiles.

This mirrors the behaviour of FILES and package_rpm's CONFFILES handling.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/package_ipk.bbclass |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index d735051..e5e76ef 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -440,7 +440,8 @@ python do_package_ipk () {
                 bb.utils.unlockfile(lf)
                 raise bb.build.FuncFailed("unable to open conffiles for writing.")
             for f in conffiles_str.split():
-                conffiles.write('%s\n' % f)
+                if os.path.exists(oe.path.join(root, f)):
+                    conffiles.write('%s\n' % f)
             conffiles.close()
 
         os.chdir(basedir)
-- 
1.7.10.4



