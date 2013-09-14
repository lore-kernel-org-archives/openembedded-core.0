Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5D5526185C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Sep 2013 05:21:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8E5LMgv023770
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 13 Sep 2013 22:21:22 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 13 Sep 2013 22:21:20 -0700
Message-ID: <5233F24F.6080102@windriver.com>
Date: Sat, 14 Sep 2013 13:21:19 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1379126215.git.hongxu.jia@windriver.com>
	<f68ed559f85f1ea1be513dcea93d9b4dad6a8e3f.1379126215.git.hongxu.jia@windriver.com>
	<5233EF2B.8050505@linux.intel.com>
In-Reply-To: <5233EF2B.8050505@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] LSB 4.1 Library Check: fix unable to find library libqt-mt.so.3
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
X-List-Received-Date: Sat, 14 Sep 2013 05:21:20 -0000
Content-Type: multipart/alternative;
	boundary="------------070307010909080407070203"

--------------070307010909080407070203
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Saul,

I have updated the branch as your suggestion.

   git://git.pokylinux.org/poky-contrib hongxu/fix-lsb-libqt3
http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-lsb-libqt3

+def get_libqt3(d):
+    if 'linuxstdbase' in d.getVar('DISTROOVERRIDES') or "":
+        if 'qt3' in d.getVar('BBFILE_COLLECTIONS') or "":
+            return 'libqt-mt3'
+
+        bb.warn('The meta-qt3 layer should be added, this layer 
provides Qt 3.x')
+        bb.warn('libraries. Its intended use is for passing LSB tests 
as Qt3 is')
+        bb.warn('a requirement for LSB')
+    return ''
+

Thanks,
Hongxu


On 09/14/2013 01:07 PM, Saul Wold wrote:
> On 09/13/2013 07:40 PM, Hongxu Jia wrote:
>> The libqt-mt is tested by lsb-dist-checker and lsb-test-desktop,
>> and it locates in meta-qt3 layer.
>> So if meta-qt3 is not added, there should be a warning to call
>> attention; if added, it will add libqt-mt to RDEPENDS.
>>
>> [YOCTO #5153]
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb | 11 
>> +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git 
>> a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb 
>> b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
>> index 1c1a8d1..c0dda5a 100644
>> --- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
>> +++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
>> @@ -193,6 +193,16 @@ RDEPENDS_packagegroup-core-lsb-python = "\
>>       python-misc \
>>   "
>>
>> +def get_libqt3(d):
>> +    if 'qt3' in d.getVar('BBFILE_COLLECTIONS') or "":
>> +        return 'libqt-mt3'
>> +
> I think this might cause unexpected behavoir for people who just 
> happen to have qt3 in their bblayer, I would also wrap the 
> linuxstdbase around the above line.
>
> Sorry for not being clear about the first time.
>
> Sau!
>
>> +    if 'linuxstdbase' in d.getVar('DISTROOVERRIDES') or "":
>> +        bb.warn('The meta-qt3 layer should be added, this layer 
>> provides Qt 3.x')
>> +        bb.warn('libraries. Its intended use is for passing LSB 
>> tests as Qt3 is')
>> +        bb.warn('a requirement for LSB')
>> +    return ''
>> +
>>   SUMMARY_packagegroup-core-lsb-desktop = "LSB Desktop"
>>   DESCRIPTION_packagegroup-core-lsb-desktop = "Packages required to 
>> support libraries \
>>       specified in the LSB Desktop specification"
>> @@ -221,6 +231,7 @@ RDEPENDS_packagegroup-core-lsb-desktop = "\
>>       atk \
>>       libasound \
>>       ${@base_contains("DISTRO_FEATURES", "opengl", "libqtopengl4", 
>> "", d)} \
>> +    ${@get_libqt3(d)} \
>>   "
>>
>>   RDEPENDS_packagegroup-core-lsb-runtime-add = "\
>>


--------------070307010909080407070203
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Hi Saul,<br>
      <br>
      I have updated the branch as your suggestion.<br>
      <br>
      &nbsp; git://git.pokylinux.org/poky-contrib hongxu/fix-lsb-libqt3<br>
      &nbsp;
<a class="moz-txt-link-freetext" href="http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-lsb-libqt3">http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-lsb-libqt3</a><br>
      <br>
      <meta http-equiv="content-type" content="text/html;
        charset=ISO-8859-1">
      +def get_libqt3(d):<br>
      +&nbsp;&nbsp;&nbsp; if 'linuxstdbase' in d.getVar('DISTROOVERRIDES') or "":<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if 'qt3' in d.getVar('BBFILE_COLLECTIONS') or "":<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 'libqt-mt3'<br>
      +<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.warn('The meta-qt3 layer should be added, this layer
      provides Qt 3.x')<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.warn('libraries. Its intended use is for passing LSB
      tests as Qt3 is')<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.warn('a requirement for LSB')<br>
      +&nbsp;&nbsp;&nbsp; return ''<br>
      +<br>
      <br>
      Thanks,<br>
      Hongxu<br>
      <br>
      <br>
      On 09/14/2013 01:07 PM, Saul Wold wrote:<br>
    </div>
    <blockquote cite="mid:5233EF2B.8050505@linux.intel.com" type="cite">On
      09/13/2013 07:40 PM, Hongxu Jia wrote:
      <br>
      <blockquote type="cite">The libqt-mt is tested by lsb-dist-checker
        and lsb-test-desktop,
        <br>
        and it locates in meta-qt3 layer.
        <br>
        So if meta-qt3 is not added, there should be a warning to call
        <br>
        attention; if added, it will add libqt-mt to RDEPENDS.
        <br>
        <br>
        [YOCTO #5153]
        <br>
        <br>
        Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
        <br>
        ---
        <br>
        &nbsp; meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb |
        11 +++++++++++
        <br>
        &nbsp; 1 file changed, 11 insertions(+)
        <br>
        <br>
        diff --git
        a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
        b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
        <br>
        index 1c1a8d1..c0dda5a 100644
        <br>
        ---
        a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
        <br>
        +++
        b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
        <br>
        @@ -193,6 +193,16 @@ RDEPENDS_packagegroup-core-lsb-python = "\
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; python-misc \
        <br>
        &nbsp; "
        <br>
        <br>
        +def get_libqt3(d):
        <br>
        +&nbsp;&nbsp;&nbsp; if 'qt3' in d.getVar('BBFILE_COLLECTIONS') or "":
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 'libqt-mt3'
        <br>
        +
        <br>
      </blockquote>
      I think this might cause unexpected behavoir for people who just
      happen to have qt3 in their bblayer, I would also wrap the
      linuxstdbase around the above line.
      <br>
      <br>
      Sorry for not being clear about the first time.
      <br>
      <br>
      Sau!
      <br>
      <br>
      <blockquote type="cite">+&nbsp;&nbsp;&nbsp; if 'linuxstdbase' in
        d.getVar('DISTROOVERRIDES') or "":
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.warn('The meta-qt3 layer should be added, this layer
        provides Qt 3.x')
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.warn('libraries. Its intended use is for passing LSB
        tests as Qt3 is')
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.warn('a requirement for LSB')
        <br>
        +&nbsp;&nbsp;&nbsp; return ''
        <br>
        +
        <br>
        &nbsp; SUMMARY_packagegroup-core-lsb-desktop = "LSB Desktop"
        <br>
        &nbsp; DESCRIPTION_packagegroup-core-lsb-desktop = "Packages required
        to support libraries \
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; specified in the LSB Desktop specification"
        <br>
        @@ -221,6 +231,7 @@ RDEPENDS_packagegroup-core-lsb-desktop = "\
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; atk \
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; libasound \
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${@base_contains("DISTRO_FEATURES", "opengl",
        "libqtopengl4", "", d)} \
        <br>
        +&nbsp;&nbsp;&nbsp; ${@get_libqt3(d)} \
        <br>
        &nbsp; "
        <br>
        <br>
        &nbsp; RDEPENDS_packagegroup-core-lsb-runtime-add = "\
        <br>
        <br>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------070307010909080407070203--
