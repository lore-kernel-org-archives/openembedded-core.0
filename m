Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1117D60C6A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 04:33:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 01E4X8sC021519
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 20:33:08 -0800 (PST)
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.202]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0468.000;
	Thu, 13 Feb 2020 20:33:07 -0800
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: "He, Zhe" <Zhe.He@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v3] perf: Correct the substitution of python
	shebangs
Thread-Index: AQHV4usOFdXJfI7dMESeN8Gsn1TlnagaGdkT
Date: Fri, 14 Feb 2020 04:33:06 +0000
Message-ID: <DBB018487F2B2F4EA51053C8975CCBF0F0A82841@ALA-MBD.corp.ad.wrs.com>
References: <20200214035737.9975-1-zhe.he@windriver.com>
In-Reply-To: <20200214035737.9975-1-zhe.he@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.24.64]
MIME-Version: 1.0
Subject: Re: [PATCH v3] perf: Correct the substitution of python	shebangs
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
X-List-Received-Date: Fri, 14 Feb 2020 04:33:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

TA

________________________________________
From: openembedded-core-bounces@lists.openembedded.org [openembedded-core-b=
ounces@lists.openembedded.org] on behalf of zhe.he@windriver.com [zhe.he@wi=
ndriver.com]
Sent: Friday, February 14, 2020 11:57 AM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH v3] perf: Correct the substitution of python  she=
bangs

From: He Zhe <zhe.he@windriver.com>

To make the native python3 is always used,

- Use sed one-liner instead
- Add substitution for ${S}/scripts/bpf_helpers_doc.py to fix the
  following warning.

File "/usr/lib/python3.6/sysconfig.py", line 421, in _init_posix
_temp =3D __import__(name, globals(), locals(), ['build_time_vars'], 0)
ModuleNotFoundError: No module named '_sysconfigdata'

This issue is first reported by Joel Stanley <joel@jms.id.au>
The sed one-liner is credited to Anuj Mittal <anuj.mittal@intel.com>

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/pe=
rf.bb
index 6d1b06693d..a6fb51d3db 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -239,11 +239,8 @@ do_configure_prepend () {
     fi

     # use /usr/bin/env instead of version specific python
-    for s in `find ${S}/tools/perf/ -name '*.py'`; do
-        sed -i 's,/usr/bin/python,/usr/bin/env python3,' "${s}"
-        sed -i 's,/usr/bin/python2,/usr/bin/env python3,' "${s}"
-        sed -i 's,/usr/bin/env python2,/usr/bin/env python3,' "${s}"
-        sed -i 's,/usr/bin/python3,/usr/bin/env python3,' "${s}"
+    for s in `find ${S}/tools/perf/ -name '*.py'` ${S}/scripts/bpf_helpers=
_doc.py; do
+        sed -i -e "s,#!.*python.*,#!${USRBINPATH}/env python3," ${s}
     done

     # unistd.h can be out of sync between libc-headers and the captured ve=
rsion in the perf source
--
2.24.1

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core=

