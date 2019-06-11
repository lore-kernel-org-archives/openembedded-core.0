Return-Path: <mac@mcrowe.com>
X-Greylist: delayed 450 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 11 Jun 2019 14:06:25 UTC
Received: from avasout02.plus.net (avasout02.plus.net [212.159.14.17])
	by mail.openembedded.org (Postfix) with ESMTP id 4784C7E635
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 14:06:24 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id ahIbhQvK0pYZWahIchysRz; Tue, 11 Jun 2019 14:58:55 +0100
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=cd2sUULM c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=dq6fvYVFJ5YA:10
	a=Q4-j1AaZAAAA:8 a=-An2I_7KAAAA:8 a=alK4_DS-AAAA:8
	a=XL-jKRkk-sbXLn9fk3UA:9
	a=CjuIK1q_8ugA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=Sq34B_EcNBM9_nrAYB9S:22
	a=rOCknGvZllDBBwZ8Yz5I:22
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>)
	id 1hahIb-0004hR-JC; Tue, 11 Jun 2019 14:58:53 +0100
Date: Tue, 11 Jun 2019 14:58:53 +0100
From: Mike Crowe <mac@mcrowe.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20190611135853.k3qhv6uaho2kyqwn@mcrowe.com>
References: <20171112163923.19517-1-mac@mcrowe.com>
	<CAP9ODKoxmsvO6ZaSNkYX3_-R234vvFoq3Ce6cWKDg_RE2tvMtg@mail.gmail.com>
	<20171211095149.ywhejbets5loutnv@mcrowe.com>
	<CAJTo0Lbp+4hmDE69Wrc5z-EvwPytweozmxBWemrbTXhN5DHwRg@mail.gmail.com>
	<20171220102822.4ohufxtgcu3lg3r5@mcrowe.com>
	<20180106201618.ktj64aparfs47yjv@mcrowe.com>
MIME-Version: 1.0
In-Reply-To: <20180106201618.ktj64aparfs47yjv@mcrowe.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CMAE-Envelope: MS4wfH64OA2bBMn8Bko6JQA/4u/YNElaGMiOJKz1tfn/SetPzMmvr6DSLYnIQYlB0pZVr92Znbbax/Id0KHgx9nH2WRVQ1+cPTLUcLhwcFuw6k0xFy0jt8V8
	eXYkzjm2ji+43To5ZN0Q+Dap9s4U11PGYKDX2Py8XVhMyOYIeKwZdOei
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] cmake: Avoid passing empty prefix to os.path.relpath
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
X-List-Received-Date: Tue, 11 Jun 2019 14:06:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Saturday 06 January 2018 at 20:16:18 +0000, Mike Crowe wrote:
> https://patchwork.openembedded.org/patch/145709/
> 
> On Wednesday 20 December 2017 at 10:28:22 +0000, Mike Crowe wrote:
> > On Monday 11 December 2017 at 13:45:26 +0000, Burton, Ross wrote:
> > > It was implicated in some build failures.  I'll re-add it and try again.
> > 
> > Thanks. Are the new results in? I had a poke about on autobuilder.yocto.io
> > but couldn't work out how to tell which builds this commit was included in.
> > Build 719 did not appear to include it.
> 
> Any more news?
> 
> Thanks.

Hi Ross,

It looks like this patch never made it in. It still applies. Please can you
try adding it again?

Thanks.

Mike.

From c5b7a0584b6d37ecb28cd2aa3d9a9a80b0178e96 Mon Sep 17 00:00:00 2001
From: Mike Crowe <mac@mcrowe.com>
Date: Sun, 12 Nov 2017 14:16:20 +0000
Subject: [PATCHv2] cmake: Avoid passing empty prefix to os.path.relpath

With meta-micro, ${prefix} is the empty string. This means that
CMAKE_INSTALL_BINDIR:PATH and friends end up containing paths starting with
many instances of "../", presumably due to os.path.relpath attempting to
find its way to the current directory.

Let's avoid this by ensuring that the root path always ends in a slash. If
it already ends in a slash then adding another one shouldn't cause any
problems.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/cmake.bbclass | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index a5cffedbc6..f80a7e2f1d 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -161,15 +161,15 @@ cmake_do_configure() {
 	  $oecmake_sitefile \
 	  ${OECMAKE_SOURCEPATH} \
 	  -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
-	  -DCMAKE_INSTALL_BINDIR:PATH=${@os.path.relpath(d.getVar('bindir'), d.getVar('prefix'))} \
-	  -DCMAKE_INSTALL_SBINDIR:PATH=${@os.path.relpath(d.getVar('sbindir'), d.getVar('prefix'))} \
-	  -DCMAKE_INSTALL_LIBEXECDIR:PATH=${@os.path.relpath(d.getVar('libexecdir'), d.getVar('prefix'))} \
+	  -DCMAKE_INSTALL_BINDIR:PATH=${@os.path.relpath(d.getVar('bindir'), d.getVar('prefix') + '/')} \
+	  -DCMAKE_INSTALL_SBINDIR:PATH=${@os.path.relpath(d.getVar('sbindir'), d.getVar('prefix') + '/')} \
+	  -DCMAKE_INSTALL_LIBEXECDIR:PATH=${@os.path.relpath(d.getVar('libexecdir'), d.getVar('prefix') + '/')} \
 	  -DCMAKE_INSTALL_SYSCONFDIR:PATH=${sysconfdir} \
-	  -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=${@os.path.relpath(d.getVar('sharedstatedir'), d.  getVar('prefix'))} \
+	  -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=${@os.path.relpath(d.getVar('sharedstatedir'), d.  getVar('prefix') + '/')} \
 	  -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=${localstatedir} \
-	  -DCMAKE_INSTALL_LIBDIR:PATH=${@os.path.relpath(d.getVar('libdir'), d.getVar('prefix'))} \
-	  -DCMAKE_INSTALL_INCLUDEDIR:PATH=${@os.path.relpath(d.getVar('includedir'), d.getVar('prefix'))} \
-	  -DCMAKE_INSTALL_DATAROOTDIR:PATH=${@os.path.relpath(d.getVar('datadir'), d.getVar('prefix'))} \
+	  -DCMAKE_INSTALL_LIBDIR:PATH=${@os.path.relpath(d.getVar('libdir'), d.getVar('prefix') + '/')} \
+	  -DCMAKE_INSTALL_INCLUDEDIR:PATH=${@os.path.relpath(d.getVar('includedir'), d.getVar('prefix') + '/')} \
+	  -DCMAKE_INSTALL_DATAROOTDIR:PATH=${@os.path.relpath(d.getVar('datadir'), d.getVar('prefix') + '/')} \
 	  -DCMAKE_INSTALL_SO_NO_EXE=0 \
 	  -DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain.cmake \
 	  -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 \
--
2.20.1

