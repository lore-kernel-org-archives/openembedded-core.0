Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 58ADB6C1D4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2018 02:30:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAC2TdHM027290
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 11 Nov 2018 18:29:49 -0800
Received: from [128.224.162.215] (128.224.162.215) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Sun, 11 Nov 2018 18:29:28 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <1541657297-30997-1-git-send-email-mingli.yu@windriver.com>
	<1541657297-30997-3-git-send-email-mingli.yu@windriver.com>
	<CAJTo0La+u72y4JiB9dGKGw==FR_8Uwu31pO19eJ78bVfnHj08Q@mail.gmail.com>
	<5BE4E504.4010809@windriver.com>
	<CAJTo0LZcL0H=sEdc7n7BRw+u-R3fHNb=2ooJO1hkPsp404PLqg@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5BE8E53B.2010405@windriver.com>
Date: Mon, 12 Nov 2018 10:28:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZcL0H=sEdc7n7BRw+u-R3fHNb=2ooJO1hkPsp404PLqg@mail.gmail.com>
X-Originating-IP: [128.224.162.215]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/7] python3: add tk support
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
X-List-Received-Date: Mon, 12 Nov 2018 02:30:48 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2018年11月09日 21:02, Burton, Ross wrote:
> On Fri, 9 Nov 2018 at 01:39, Yu, Mingli <mingli.yu@windriver.com> wrote:
>>> Why is this here and not in the manifest?
>>
>> It's because we can optionally enable or disable tk via PACKAGECONFIG,
>> if add it to manifest then we need to always enable tk which is also the
>> implement in v1.
>
> Are you sure?  As I understand it there won't be any errors if the
> contents don't exist.  And to be honest if there are, then the
> manifest tooling should handle that neatly without special-casing.

Hi Ross,

Thanks for your feedback!

I didn't quite understand what you mean. As I know, if we add the the 
setting in manifest as below:
diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json 
b/meta/recipes-devtools/python/python3/python3-manifest.json
index f922561..09c9199 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -1056,10 +1056,12 @@
      "tkinter": {
          "summary": "Python Tcl/Tk bindings",
          "rdepends": [
-            "core"
+            "core",
+            "tk"
          ],
          "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/tkinter"
+            "${libdir}/python${PYTHON_MAJMIN}/tkinter",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter*.so"
          ],
          "cached": []
      },

There comes below error:
ERROR: Nothing RPROVIDES 'python3-tk' (but 
/mybuild/layers/oe-core/meta/recipes-devtools/python/python3_3.5.6.bb 
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'python3-tk' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-tk']
ERROR: Required build target 'python3' has no buildable providers.
Missing or unbuildable dependency chain was: ['python3', 'python3-tk']

That's to say, we still need to add some fix in 
meta/recipes-devtools/python/python3_3.5.6.bb. If so, it may be flexible 
and clear to directly to make the implement just as what I send in the RR.

Thanks,

>
> Ross
>

