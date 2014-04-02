Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 962406EDF9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Apr 2014 01:24:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s321OTwe010963
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 1 Apr 2014 18:24:30 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Tue, 1 Apr 2014 18:24:29 -0700
Message-ID: <533B66C9.8010804@windriver.com>
Date: Wed, 2 Apr 2014 09:24:25 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <cover.1396343261.git.kai.kang@windriver.com>
	<26f22e4e2b8b1fa1eff604feac7088986d561eab.1396343261.git.kai.kang@windriver.com>
	<1396349360.1432.2.camel@ted>
	<CAP9ODKpm7Kw5MJvrPVvUga_nhUhtNTPsD1ciEk5Rp0zOES3CUg@mail.gmail.com>
In-Reply-To: <CAP9ODKpm7Kw5MJvrPVvUga_nhUhtNTPsD1ciEk5Rp0zOES3CUg@mail.gmail.com>
X-Originating-IP: [128.224.162.231]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] cmake: follow ptest output format
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
X-List-Received-Date: Wed, 02 Apr 2014 01:24:36 -0000
Content-Type: multipart/alternative;
	boundary="------------030703000605070001030606"

--------------030703000605070001030606
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2014?04?02? 06:33, Otavio Salvador wrote:
> Hello,
>
> On Tue, Apr 1, 2014 at 7:49 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Tue, 2014-04-01 at 17:09 +0800, Kai Kang wrote:
>>> From: Li Wang <li.wang@windriver.com>
>>>
>>> ptest output format is incorrect, according to yocto Development Manual
>>> (http://www.yoctoproject.org/docs/latest/dev-manual/dev-manual.html#testing-packages-with-ptest)
>>>
>>> The test generates output in the format used by Automake:
>>> <result>: <testname>
>>> where the result can be PASS, FAIL, or SKIP, and the testname can be any identifying string.
>>>
>>> So we should change the test result format to match yocto ptest rules.
>>>
>>> Signed-off-by: Li Wang <li.wang@windriver.com>
>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>> ---
>>>   meta/recipes-devtools/cmake/cmake.inc              |   1 +
>>>   .../cmake/cmake/follow_ptest_output_format.patch   | 118 +++++++++++++++++++++
>>>   2 files changed, 119 insertions(+)
>>>   create mode 100644 meta/recipes-devtools/cmake/cmake/follow_ptest_output_format.patch
>>>
>>> diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
>>> index 1d5303f..254af45 100644
>>> --- a/meta/recipes-devtools/cmake/cmake.inc
>>> +++ b/meta/recipes-devtools/cmake/cmake.inc
>>> @@ -17,6 +17,7 @@ SRC_URI = "http://www.cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz
>>>              file://aarch64-kwsys.patch \
>>>              file://qt4-fail-silent.patch \
>>>              file://cmake-2.8.11.2-FindFreetype.patch \
>>> +           file://follow_ptest_output_format.patch \
>>>              "
>>>
>>>   inherit autotools-brokensep
>>> diff --git a/meta/recipes-devtools/cmake/cmake/follow_ptest_output_format.patch b/meta/recipes-devtools/cmake/cmake/follow_ptest_output_format.patch
>>> new file mode 100644
>>> index 0000000..5428df2
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/cmake/cmake/follow_ptest_output_format.patch
>>> @@ -0,0 +1,118 @@
>>> +cmake: follow ptest output format
>>> +
>>> +ptest output format is incorrect, according to yocto Development Manual
>>> +(http://www.yoctoproject.org/docs/latest/dev-manual/dev-manual.html#testing-packages-with-ptest)
>>> +5.10.6. Testing Packages With ptest
>>> +The test generates output in the format used by Automake:
>>> +<result>: <testname>
>>> +where the result can be PASS, FAIL, or SKIP, and the testname can be any identifying string.
>>> +So we should change the test result format to match yocto ptest rules.
>>> +
>>> +Signed-off-by: Li Wang <li.wang@windriver.com>
>> No upstream status. Is there any chance of this going upstream? Might we
>> be better off postprocessing the output with a script to put it into the
>> right format?
> I agree with both remarks. It'd be good to try to get it somehow
> integrated upstream and for OE-Core interim solution would be better
> to 'convert' using an external script. This may break external tests
> tools people may be using as it changes the format without allowing to
> 'revert' for normal format.
>

OK. I'll send it upstream and see what's going on.

-- 
Regards,
Neil | Kai Kang


--------------030703000605070001030606
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2014&#24180;04&#26376;02&#26085; 06:33, Otavio Salvador
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAP9ODKpm7Kw5MJvrPVvUga_nhUhtNTPsD1ciEk5Rp0zOES3CUg@mail.gmail.com"
      type="cite">
      <pre wrap="">Hello,

On Tue, Apr 1, 2014 at 7:49 AM, Richard Purdie
<a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">On Tue, 2014-04-01 at 17:09 +0800, Kai Kang wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="">From: Li Wang <a class="moz-txt-link-rfc2396E" href="mailto:li.wang@windriver.com">&lt;li.wang@windriver.com&gt;</a>

ptest output format is incorrect, according to yocto Development Manual
(<a class="moz-txt-link-freetext" href="http://www.yoctoproject.org/docs/latest/dev-manual/dev-manual.html#testing-packages-with-ptest">http://www.yoctoproject.org/docs/latest/dev-manual/dev-manual.html#testing-packages-with-ptest</a>)

The test generates output in the format used by Automake:
&lt;result&gt;: &lt;testname&gt;
where the result can be PASS, FAIL, or SKIP, and the testname can be any identifying string.

So we should change the test result format to match yocto ptest rules.

Signed-off-by: Li Wang <a class="moz-txt-link-rfc2396E" href="mailto:li.wang@windriver.com">&lt;li.wang@windriver.com&gt;</a>
Signed-off-by: Robert Yang <a class="moz-txt-link-rfc2396E" href="mailto:liezhi.yang@windriver.com">&lt;liezhi.yang@windriver.com&gt;</a>
Signed-off-by: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>
---
 meta/recipes-devtools/cmake/cmake.inc              |   1 +
 .../cmake/cmake/follow_ptest_output_format.patch   | 118 +++++++++++++++++++++
 2 files changed, 119 insertions(+)
 create mode 100644 meta/recipes-devtools/cmake/cmake/follow_ptest_output_format.patch

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 1d5303f..254af45 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -17,6 +17,7 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="http://www.cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gzfile://aarch64-kwsys.patch\file://qt4-fail-silent.patch\file://cmake-2.8.11.2-FindFreetype.patch\+file://follow_ptest_output_format.patch\">"http://www.cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz
            file://aarch64-kwsys.patch \
            file://qt4-fail-silent.patch \
            file://cmake-2.8.11.2-FindFreetype.patch \
+           file://follow_ptest_output_format.patch \
            "</a>

 inherit autotools-brokensep
diff --git a/meta/recipes-devtools/cmake/cmake/follow_ptest_output_format.patch b/meta/recipes-devtools/cmake/cmake/follow_ptest_output_format.patch
new file mode 100644
index 0000000..5428df2
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/follow_ptest_output_format.patch
@@ -0,0 +1,118 @@
+cmake: follow ptest output format
+
+ptest output format is incorrect, according to yocto Development Manual
+(<a class="moz-txt-link-freetext" href="http://www.yoctoproject.org/docs/latest/dev-manual/dev-manual.html#testing-packages-with-ptest">http://www.yoctoproject.org/docs/latest/dev-manual/dev-manual.html#testing-packages-with-ptest</a>)
+5.10.6. Testing Packages With ptest
+The test generates output in the format used by Automake:
+&lt;result&gt;: &lt;testname&gt;
+where the result can be PASS, FAIL, or SKIP, and the testname can be any identifying string.
+So we should change the test result format to match yocto ptest rules.
+
+Signed-off-by: Li Wang <a class="moz-txt-link-rfc2396E" href="mailto:li.wang@windriver.com">&lt;li.wang@windriver.com&gt;</a>
</pre>
        </blockquote>
        <pre wrap="">
No upstream status. Is there any chance of this going upstream? Might we
be better off postprocessing the output with a script to put it into the
right format?
</pre>
      </blockquote>
      <pre wrap="">
I agree with both remarks. It'd be good to try to get it somehow
integrated upstream and for OE-Core interim solution would be better
to 'convert' using an external script. This may break external tests
tools people may be using as it changes the format without allowing to
'revert' for normal format.

</pre>
    </blockquote>
    <font size="+1"><br>
      OK. I'll send it upstream and see what<font size="+1">'s going on.<br>
      </font></font><br>
    <pre class="moz-signature" cols="72">-- 
Regards,
Neil | Kai Kang</pre>
  </body>
</html>

--------------030703000605070001030606--
