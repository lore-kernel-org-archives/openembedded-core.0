Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EAA2B6E710
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 11:04:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0HB4P5Y021016
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 17 Jan 2014 03:04:26 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 17 Jan 2014 03:01:27 -0800
Message-ID: <52D90D85.7010106@windriver.com>
Date: Fri, 17 Jan 2014 19:01:25 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1389940146.git.liezhi.yang@windriver.com>	
	<981567c4dfef59be08373f124b36739449a546a1.1389940146.git.liezhi.yang@windriver.com>
	<1389954978.14987.106.camel@ted>
In-Reply-To: <1389954978.14987.106.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sstate.bbclass: remove previous version's stamp
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
X-List-Received-Date: Fri, 17 Jan 2014 11:04:27 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/17/2014 06:36 PM, Richard Purdie wrote:
> On Fri, 2014-01-17 at 14:43 +0800, Robert Yang wrote:
>> +        # Keep the sigdata
>> +        if not re.match(re_sigdata, stfile):
>> +            oe.path.remove(stfile)
>
> I'm not sure its worth the overhead of using regexps here. Can we not do
> something simple like:
>
> if ".sigdata." not in stfile:
>

Sounds better, I've updated the PULL:

git://git.pokylinux.org/poky-contrib rbt/clean_stamp

and here is the patch:

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 35c3f85..d4e0dcb 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -331,11 +331,17 @@ def sstate_clean_manifest(manifest, d):

  def sstate_clean(ss, d):
      import oe.path
+    import glob

      d2 = d.createCopy()
+    stamp_clean = d.getVar("STAMPCLEAN", True)
      extrainf = d.getVarFlag("do_" + ss['task'], 'stamp-extra-info', True)
      if extrainf:
          d2.setVar("SSTATE_MANMACH", extrainf)
+        wildcard_stfile = "%s.do_%s*.%s" % (stamp_clean, ss['task'], extrainf)
+    else:
+        wildcard_stfile = "%s.do_%s*" % (stamp_clean, ss['task'])
+
      manifest = d2.expand("${SSTATE_MANFILEPREFIX}.%s" % ss['name'])

      if os.path.exists(manifest):
@@ -350,15 +356,11 @@ def sstate_clean(ss, d):
          for lock in locks:
              bb.utils.unlockfile(lock)

-    stfile = d.getVar("STAMP", True) + ".do_" + ss['task']
-    oe.path.remove(stfile)
-    oe.path.remove(stfile + "_setscene")
-    if extrainf:
-        oe.path.remove(stfile + ".*" + extrainf)
-        oe.path.remove(stfile + "_setscene" + ".*" + extrainf)
-    else:
-        oe.path.remove(stfile + ".*")
-        oe.path.remove(stfile + "_setscene" + ".*")
+    # Remove the current and previous stamps, but keep the sigdata
+    for stfile in glob.glob(wildcard_stfile):
+        # Keep the sigdata
+        if ".sigdata." not in stfile:
+            oe.path.remove(stfile)

  CLEANFUNCS += "sstate_cleanall"

// Robert

> Cheers,
>
> Richard
>
>
>

