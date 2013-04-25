Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UVMCu-0002uF-DI
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 15:27:32 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r3PD9hvV001278
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2013 06:09:43 -0700 (PDT)
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 25 Apr 2013 06:09:43 -0700
Message-ID: <51792B15.4010001@windriver.com>
Date: Thu, 25 Apr 2013 21:09:41 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: python's assert doesn't work
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
X-List-Received-Date: Thu, 25 Apr 2013 13:27:40 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Both native and target python's assert doesn't work, because python
has been optimized by default by us:

--- Python-2.6.1.orig/Python/compile.c
+++ Python-2.6.1/Python/compile.c
@@ -32,7 +32,7 @@
  #include "symtable.h"
  #include "opcode.h"

-int Py_OptimizeFlag = 0;
+int Py_OptimizeFlag = 1;

  #define DEFAULT_BLOCK_SIZE 16
  #define DEFAULT_BLOCKS 8

The optimization should be specified by the user, for example,  run by
"python -O/OO", or "export PYTHONOPTIMIZE" in the env, but we have hardcode
it, then we can't change it back to 0, and this causes the "assert" doesn't
work, e.g.: the "assert False" should raise error, but it doesn't, this may
hide or cause unexpected errors.

I'd like to send a patch to change it back if you are fine with it,
and we can set PYTHONOPTIMIZE in the env if we really need it, this
gives the user a way to disable the optimization.

-- 
Thanks

Robert


