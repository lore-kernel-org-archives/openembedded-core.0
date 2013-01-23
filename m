Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1Ty7Pa-0003zw-3V
	for Openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 21:59:11 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0NKhalX029487
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2013 12:43:37 -0800 (PST)
Received: from e6410-2 (172.25.40.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Wed, 23 Jan 2013 12:43:36 -0800
Date: Wed, 23 Jan 2013 14:43:20 -0600
From: Peter Seebach <peter.seebach@windriver.com>
To: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Message-ID: <20130123144320.191c91a3@e6410-2>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Is this a bug? Installed-but-not-packaged warning for a file which is in a package
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
X-List-Received-Date: Wed, 23 Jan 2013 20:59:12 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

FILES_${PN} = "fascinating"

do_install() {
	touch ${D}/fascinating
}

At least in our local copy of oe-core, this results in:

1. A package which contains a /fascinating file.
2. An installed-but-unpackaged warning for /fascinating.

This confused the heck out of me. I eventually figured it out: The "not
in seen" test is not aware of the possibility of differing path names.
In general, all path names in FILES_* are being written as absolute
paths by convention; in the actual code, this is silently corrected by
the addition of a leading period.

But an unqualified path works; it's treated as relative to the
sysroot/image/whatever, and it has the expected behavior. But then we
insert "fascinating" in seen, and check for "./fascinating" in the next
phase.

Possible solution:

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index b06cca5..9d50a61 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -981,6 +981,8 @@ python populate_packages () {
                 file.replace("//", "/")
             if os.path.isabs(file):
                 file = '.' + file
+            if not file.startswith("./")
+                fle = './' + file
             if not os.path.islink(file):
                 if os.path.isdir(file):

Before I send this as an actual patch and such: Is this behavior a bug?
If it is a bug, is this the right fix, or should we do something else,
like reject non-absolute paths?

Note that just adding a / to files that don't start with one doesn't
work; there appear to be at least *some* non-absolute paths in some
packages.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


