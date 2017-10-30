Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5C15971A32
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Oct 2017 09:43:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v9U9hwvS019217
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 30 Oct 2017 02:43:58 -0700 (PDT)
Received: from [128.224.163.189] (128.224.163.189) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 30 Oct 2017 02:43:57 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1509097262.git.Qi.Chen@windriver.com>
	<4a6127f002e0fa3552e1dbdec8b8d9f94265384a.1509097263.git.Qi.Chen@windriver.com>
	<CAMKF1sqQ6E6vKD8rtpF4MXR=6ceOWKnmU9h5gLMWQFc87xSjZw@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <8b5afe37-5ead-0bda-3293-141f5d297a65@windriver.com>
Date: Mon, 30 Oct 2017 17:45:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqQ6E6vKD8rtpF4MXR=6ceOWKnmU9h5gLMWQFc87xSjZw@mail.gmail.com>
X-Originating-IP: [128.224.163.189]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gcc: fix miscompilation on mips64
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
X-List-Received-Date: Mon, 30 Oct 2017 09:43:58 -0000
Content-Type: multipart/alternative;
	boundary="------------15B56F50137DF0F562E8CB2F"

--------------15B56F50137DF0F562E8CB2F
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/2017 01:40 AM, Khem Raj wrote:
> On Fri, Oct 27, 2017 at 2:43 AM, Chen Qi <Qi.Chen@windriver.com> wrote:
>> We've observed strange behaviour of `systemctl status <xxx> on qemumips64.
>> The output of the command is like `systemctl show <xxx>', which is incorrect.
>>
>> This patch is from gcc bugzilla's attachment.
>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81803
>>
>> The patch hasn't been merged into gcc. But it does solve the above problem.
>>
> This looks ok. Can you help by providing your testing results to gcc bugzilla
> so the patch can then be submitted to gcc ml.

Some updates in this issue.

1) I've provided information in gcc bugzilla. The author says that he's 
going to submit the patch to gcc mailing list.

2) I've update remote branch to fix a typo ('mips4' --> 'mips64').

   git://git.pokylinux.org/poky-contrib ChenQi/bug12266
   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/bug12266


3) 'core-image-sato + testimage' has been tested on other qemu machines 
including qemux86-64, qemux86, qemumips, qemuppc, qemuarm64.

Best Regards,
Chen Qi

>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/recipes-devtools/gcc/gcc-7.2.inc              |  1 +
>>   .../fix-miscompilation-for-O1-on-mips64el.patch    | 35 ++++++++++++++++++++++
>>   2 files changed, 36 insertions(+)
>>   create mode 100644 meta/recipes-devtools/gcc/gcc-7.2/fix-miscompilation-for-O1-on-mips64el.patch
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-7.2.inc b/meta/recipes-devtools/gcc/gcc-7.2.inc
>> index 5883bc6..04edad7 100644
>> --- a/meta/recipes-devtools/gcc/gcc-7.2.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-7.2.inc
>> @@ -75,6 +75,7 @@ SRC_URI = "\
>>              file://0048-gcc-Enable-static-PIE.patch \
>>              file://fix-segmentation-fault-precompiled-hdr.patch \
>>              file://0050-RISC-V-Handle-non-legitimate-address-in-riscv_legiti.patch \
>> +           file://fix-miscompilation-for-O1-on-mips64el.patch \
>>              ${BACKPORTS} \
>>   "
>>   BACKPORTS = "\
>> diff --git a/meta/recipes-devtools/gcc/gcc-7.2/fix-miscompilation-for-O1-on-mips64el.patch b/meta/recipes-devtools/gcc/gcc-7.2/fix-miscompilation-for-O1-on-mips64el.patch
>> new file mode 100644
>> index 0000000..28020b0
>> --- /dev/null
>> +++ b/meta/recipes-devtools/gcc/gcc-7.2/fix-miscompilation-for-O1-on-mips64el.patch
>> @@ -0,0 +1,35 @@
>> +This patch comes from https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81803
>> +
>> +Author: mpf <mpf@138bc75d-0d04-0410-961f-82ee72b054a4>
>> +
>> +This patch hasn't been merged into gcc. But it does solve the problem of
>> +strange behaviour of `systemd status <xxx>' on qemumips64.
>> +
>> +Upstream-Status: Pending [Taken from gcc bugzilla's attachment]
>> +
>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> +---
>> + gcc/lra-constraints.c | 7 ++++++-
>> + 1 file changed, 6 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/gcc/lra-constraints.c b/gcc/lra-constraints.c
>> +index c8bc9b9a66f..6d319662b09 100644
>> +--- a/gcc/lra-constraints.c
>> ++++ b/gcc/lra-constraints.c
>> +@@ -4235,7 +4235,12 @@ curr_insn_transform (bool check_only_p)
>> +                         && (goal_alt[i] == NO_REGS
>> +                             || (simplify_subreg_regno
>> +                                 (ira_class_hard_regs[goal_alt[i]][0],
>> +-                                 GET_MODE (reg), byte, mode) >= 0)))))
>> ++                                 GET_MODE (reg), byte, mode) >= 0))))
>> ++                    || (type != OP_IN
>> ++                        && GET_MODE_PRECISION (mode)
>> ++                        < GET_MODE_PRECISION (GET_MODE (reg))
>> ++                        && GET_MODE_SIZE (GET_MODE (reg)) <= UNITS_PER_WORD
>> ++                        && WORD_REGISTER_OPERATIONS))
>> +               {
>> +                 /* An OP_INOUT is required when reloading a subreg of a
>> +                    mode wider than a word to ensure that data beyond the
>> +--
>> +2.13.0
>> +
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--------------15B56F50137DF0F562E8CB2F
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 10/28/2017 01:40 AM, Khem Raj wrote:<br>
    </div>
    <blockquote
cite="mid:CAMKF1sqQ6E6vKD8rtpF4MXR=6ceOWKnmU9h5gLMWQFc87xSjZw@mail.gmail.com"
      type="cite">
      <pre wrap="">On Fri, Oct 27, 2017 at 2:43 AM, Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">We've observed strange behaviour of `systemctl status &lt;xxx&gt; on qemumips64.
The output of the command is like `systemctl show &lt;xxx&gt;', which is incorrect.

This patch is from gcc bugzilla's attachment.
<a class="moz-txt-link-freetext" href="https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81803">https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81803</a>

The patch hasn't been merged into gcc. But it does solve the above problem.

</pre>
      </blockquote>
      <pre wrap="">
This looks ok. Can you help by providing your testing results to gcc bugzilla
so the patch can then be submitted to gcc ml.
</pre>
    </blockquote>
    <br>
    Some updates in this issue.<br>
    <br>
    1) I've provided information in gcc bugzilla. The author says that
    he's going to submit the patch to gcc mailing list.<br>
    <br>
    2) I've update remote branch to fix a typo ('mips4' --&gt;
    'mips64').
    <pre wrap="">  git://git.pokylinux.org/poky-contrib ChenQi/bug12266
  <a class="moz-txt-link-freetext" href="http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/bug12266">http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/bug12266</a></pre>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <title></title>
    <meta name="generator" content="LibreOffice 4.2.8.2 (Linux)">
    <style type="text/css">
	<!--
		@page { margin: 0.79in }
		p { margin-bottom: 0.1in; direction: ltr; color: #000000; line-height: 120%; widows: 2; orphans: 2 }
		p.western { font-family: "Times New Roman", serif; font-size: 12pt; so-language: en-US }
		p.cjk { font-family: "Times New Roman", serif; font-size: 12pt; so-language: zh-CN }
		p.ctl { font-family: "Times New Roman", serif; font-size: 12pt; so-language: ar-SA }
		a:link { color: #000000 }
	-->
	</style><br>
    3) 'core-image-sato + testimage' has been tested on other qemu
    machines including qemux86-64, qemux86, qemumips, qemuppc,
    qemuarm64.<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <br>
    <blockquote
cite="mid:CAMKF1sqQ6E6vKD8rtpF4MXR=6ceOWKnmU9h5gLMWQFc87xSjZw@mail.gmail.com"
      type="cite">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
---
 meta/recipes-devtools/gcc/gcc-7.2.inc              |  1 +
 .../fix-miscompilation-for-O1-on-mips64el.patch    | 35 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.2/fix-miscompilation-for-O1-on-mips64el.patch

diff --git a/meta/recipes-devtools/gcc/gcc-7.2.inc b/meta/recipes-devtools/gcc/gcc-7.2.inc
index 5883bc6..04edad7 100644
--- a/meta/recipes-devtools/gcc/gcc-7.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-7.2.inc
@@ -75,6 +75,7 @@ SRC_URI = "\
            <a class="moz-txt-link-freetext" href="file://0048-gcc-Enable-static-PIE.patch">file://0048-gcc-Enable-static-PIE.patch</a> \
            <a class="moz-txt-link-freetext" href="file://fix-segmentation-fault-precompiled-hdr.patch">file://fix-segmentation-fault-precompiled-hdr.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0050-RISC-V-Handle-non-legitimate-address-in-riscv_legiti.patch">file://0050-RISC-V-Handle-non-legitimate-address-in-riscv_legiti.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://fix-miscompilation-for-O1-on-mips64el.patch">file://fix-miscompilation-for-O1-on-mips64el.patch</a> \
            ${BACKPORTS} \
 "
 BACKPORTS = "\
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/fix-miscompilation-for-O1-on-mips64el.patch b/meta/recipes-devtools/gcc/gcc-7.2/fix-miscompilation-for-O1-on-mips64el.patch
new file mode 100644
index 0000000..28020b0
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-7.2/fix-miscompilation-for-O1-on-mips64el.patch
@@ -0,0 +1,35 @@
+This patch comes from <a class="moz-txt-link-freetext" href="https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81803">https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81803</a>
+
+Author: mpf &lt;mpf@138bc75d-0d04-0410-961f-82ee72b054a4&gt;
+
+This patch hasn't been merged into gcc. But it does solve the problem of
+strange behaviour of `systemd status &lt;xxx&gt;' on qemumips64.
+
+Upstream-Status: Pending [Taken from gcc bugzilla's attachment]
+
+Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
+---
+ gcc/lra-constraints.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/gcc/lra-constraints.c b/gcc/lra-constraints.c
+index c8bc9b9a66f..6d319662b09 100644
+--- a/gcc/lra-constraints.c
++++ b/gcc/lra-constraints.c
+@@ -4235,7 +4235,12 @@ curr_insn_transform (bool check_only_p)
+                         &amp;&amp; (goal_alt[i] == NO_REGS
+                             || (simplify_subreg_regno
+                                 (ira_class_hard_regs[goal_alt[i]][0],
+-                                 GET_MODE (reg), byte, mode) &gt;= 0)))))
++                                 GET_MODE (reg), byte, mode) &gt;= 0))))
++                    || (type != OP_IN
++                        &amp;&amp; GET_MODE_PRECISION (mode)
++                        &lt; GET_MODE_PRECISION (GET_MODE (reg))
++                        &amp;&amp; GET_MODE_SIZE (GET_MODE (reg)) &lt;= UNITS_PER_WORD
++                        &amp;&amp; WORD_REGISTER_OPERATIONS))
+               {
+                 /* An OP_INOUT is required when reloading a subreg of a
+                    mode wider than a word to ensure that data beyond the
+--
+2.13.0
+
--
1.9.1

--
_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>
</pre>
      </blockquote>
      <pre wrap="">
</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------15B56F50137DF0F562E8CB2F--
