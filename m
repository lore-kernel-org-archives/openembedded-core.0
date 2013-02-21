Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1U8fsG-0008Ju-NV
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Feb 2013 00:48:33 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1LNWADt005915
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Feb 2013 15:32:10 -0800 (PST)
Received: from e6410-2 (172.25.40.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Thu, 21 Feb 2013 15:32:09 -0800
Date: Thu, 21 Feb 2013 17:31:50 -0600
From: Peter Seebach <peter.seebach@windriver.com>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Message-ID: <20130221173150.5a8764e4@e6410-2>
In-Reply-To: <13cff11cfb1.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
References: <cover.1361468282.git.peter.seebach@windriver.com>
	<da66b07f031b6522b25dc353724b3c656d7511e1.1361468282.git.peter.seebach@windriver.com>
	<13cff11cfb1.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] More n32 fixups
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
X-List-Received-Date: Thu, 21 Feb 2013 23:48:34 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Fri, 22 Feb 2013 00:23:48 +0100
Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> wrote:

> > Also, the insane.bbclass change spelled "mips64el" as "mipsel64",
> > which no one noticed because no one's using little-endian n32,
> > apparently.  
> 
> Would be great if you could have a look at the FIXME in 
> meta/recipes-core/uclibc/uclibc-config.inc for the correct setting of 
> the respective mips ABI.

Hmm. I can look, but I don't think I've touched uclibc in a fairly
long time. Untested, but possibly pretty close:

--- a/meta/recipes-core/uclibc/uclibc-config.inc
+++ b/meta/recipes-core/uclibc/uclibc-config.inc
@@ -73,9 +73,11 @@ def map_uclibc_abi(o, d):
             return 'ARM_EABI'
         else:
             return 'ARM_OABI'
-    # FIXME: This is inaccurate! Handle o32, n32, n64
     elif re.match('^mips.*64$', arch):
-        return 'MIPS_N64_ABI'
+       if o.endswith('gnun32'):
+            return 'MIPS_N32_ABI'
+       else:
+            return 'MIPS_N64_ABI'
     elif re.match('^mips.*', arch):
         return 'MIPS_O32_ABI'
     return ""

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


