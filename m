Return-Path: <Yanjun.Zhu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4AF3165E39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 10:14:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5CAEkUc003951
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Jun 2014 03:14:48 -0700 (PDT)
Received: from [128.224.162.201] (128.224.162.201) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Thu, 12 Jun 2014 03:14:46 -0700
Message-ID: <53997D96.5040906@windriver.com>
Date: Thu, 12 Jun 2014 18:14:46 +0800
From: yzhu1 <Yanjun.Zhu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, "rongqing.li@windriver.com"
	<rongqing.li@windriver.com>
References: <1402039028-17192-1-git-send-email-rongqing.li@windriver.com>
	<CAMKF1sp27ENENTNh6B0woVgh9AmY6zfpLX6Q19y1NciY8QUzKQ@mail.gmail.com>
In-Reply-To: <CAMKF1sp27ENENTNh6B0woVgh9AmY6zfpLX6Q19y1NciY8QUzKQ@mail.gmail.com>
X-Originating-IP: [128.224.162.201]
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] relocate_sdk.py: fix lib path error
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
X-List-Received-Date: Thu, 12 Jun 2014 10:14:52 -0000
Content-Type: multipart/alternative;
	boundary="------------030205010909040408050500"

--------------030205010909040408050500
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 06/06/2014 08:22 PM, Khem Raj wrote:
>
>
> On Friday, June 6, 2014, <rongqing.li@windriver.com 
> <mailto:rongqing.li@windriver.com>> wrote:
>
>     From: yzhu1 <yanjun.zhu@windriver.com <javascript:;>>
>
>     In centos 5.9 32bit, ld lib does not contain some flags, so ld
>     lib is not parsed. So correct lib path is not got from ld lib.
>
>
> Can you explain with examples what's going on here ?
Hi,

Before relocate_sdk.sh is executed, it needs the parameters: 
path/ld-linux-x86-64.so.2 path/dmesg.util-linux path/kill.util-linux 
path/reset.util-linux .....
The file list (path/dmesg.util-linux path/kill.util-linux 
path/reset.util-linux .....) is collected by "grep 
'\(executable\|dynamically linked\)'".

So "dynamically linked" is very import to the file ld-linux-x86-64.so.2. 
But in redhat 5.9(32 bit)

This file is as below:

ELF 32-bit LSB shared object, Intel 80386, version 1 (SYSV), stripped

In Ubuntu 12.04 (64bit)

This file is as below:

ELF 32-bit LSB shared object, Intel 80386, version 1 (SYSV), dynamically 
linked, BuildID[sha1]=0xbb8c5184d8d41f31093193a2ec8d3f6f10964cd2, stripped

In this case, we can find in Ubuntu 12.04(64 bit), the flag "dynamically 
linked" is present, so ld-linux-x86-64.so.2 can be included in the file 
list. relocate_sdk.py can work according to the information from 
ld-linux-x86-64.so.2. But in redhat 5.9(32bit), the flag does not exist. 
relocate_sdk.py can not get the information from ld-linux-x86-64.so.2 
since this file is not included in the file list.

The same error occurs on redhat6.0(32 bit).

So the direct solution to this defect is to force this file 
ld-linux-x86-64.so.2 exist in file list.

If any problem, please feel free to let me know.

Best Regards!
Zhu Yanjun

>
>     Signed-off-by: yzhu1 <yanjun.zhu@windriver.com <javascript:;>>
>     ---
>      scripts/relocate_sdk.py |    2 +-
>      1 file changed, 1 insertion(+), 1 deletion(-)
>
>     diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
>     index 05d9fd6..a05a7fa 100755
>     --- a/scripts/relocate_sdk.py
>     +++ b/scripts/relocate_sdk.py
>     @@ -201,7 +201,7 @@ else:
>          new_prefix = sys.argv[1].encode()
>          new_dl_path = sys.argv[2].encode()
>
>     -executables_list = sys.argv[3:]
>     +executables_list = sys.argv[2:]
>
>      for e in executables_list:
>          perms = os.stat(e)[stat.ST_MODE]
>     --
>     1.7.10.4
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org <javascript:;>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


--------------030205010909040408050500
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 06/06/2014 08:22 PM, Khem Raj wrote:<br>
    </div>
    <blockquote
cite="mid:CAMKF1sp27ENENTNh6B0woVgh9AmY6zfpLX6Q19y1NciY8QUzKQ@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <br>
      <br>
      On Friday, June 6, 2014, &lt;<a moz-do-not-send="true"
        href="mailto:rongqing.li@windriver.com">rongqing.li@windriver.com</a>&gt;
      wrote:<br>
      <blockquote class="gmail_quote" style="margin:0 0 0
        .8ex;border-left:1px #ccc solid;padding-left:1ex">
        From: yzhu1 &lt;<a moz-do-not-send="true" href="javascript:;"
          onclick="_e(event, 'cvml', 'yanjun.zhu@windriver.com')">yanjun.zhu@windriver.com</a>&gt;<br>
        <br>
        In centos 5.9 32bit, ld lib does not contain some flags, so ld<br>
        lib is not parsed. So correct lib path is not got from ld lib.</blockquote>
      <div><br>
      </div>
      <div>Can you explain with examples what's going on here ? <br>
      </div>
    </blockquote>
    Hi,<br>
    <br>
    Before relocate_sdk.sh is executed, it needs the parameters:
    path/ld-linux-x86-64.so.2 path/dmesg.util-linux path/kill.util-linux
    path/reset.util-linux .....<br>
    The file list (path/dmesg.util-linux path/kill.util-linux
    path/reset.util-linux .....) is collected by "grep
    '\(executable\|dynamically linked\)'".<br>
    <br>
    So "dynamically linked" is very import to the file
    ld-linux-x86-64.so.2. But in redhat 5.9(32 bit)<br>
    <br>
    This file is as below:<br>
    <br>
    ELF 32-bit LSB shared object, Intel 80386, version 1 (SYSV),
    stripped<br>
    <br>
    In Ubuntu 12.04 (64bit)<br>
    <br>
    This file is as below:<br>
    <br>
    ELF 32-bit LSB shared object, Intel 80386, version 1 (SYSV), <font
      color="#ff0000">dynamically linked</font>,
    BuildID[sha1]=0xbb8c5184d8d41f31093193a2ec8d3f6f10964cd2, stripped<br>
    <br>
    In this case, we can find in Ubuntu 12.04(64 bit), the flag
    "dynamically linked" is present, so ld-linux-x86-64.so.2 can be
    included in the file list. relocate_sdk.py can work according to the
    information from ld-linux-x86-64.so.2. But in redhat 5.9(32bit), the
    flag does not exist. relocate_sdk.py can not get the information
    from ld-linux-x86-64.so.2 since this file is not included in the
    file list.<br>
    <br>
    The same error occurs on redhat6.0(32 bit).<br>
    <br>
    So the direct solution to this defect is to force this file
    ld-linux-x86-64.so.2 exist in file list.<br>
    <br>
    If any problem, please feel free to let me know.<br>
    <br>
    Best Regards!<br>
    Zhu Yanjun<br>
    <br>
    <blockquote
cite="mid:CAMKF1sp27ENENTNh6B0woVgh9AmY6zfpLX6Q19y1NciY8QUzKQ@mail.gmail.com"
      type="cite">
      <blockquote class="gmail_quote" style="margin:0 0 0
        .8ex;border-left:1px #ccc solid;padding-left:1ex">
        <br>
        Signed-off-by: yzhu1 &lt;<a moz-do-not-send="true"
          href="javascript:;" onclick="_e(event, 'cvml',
          'yanjun.zhu@windriver.com')">yanjun.zhu@windriver.com</a>&gt;<br>
        ---<br>
         scripts/relocate_sdk.py |    2 +-<br>
         1 file changed, 1 insertion(+), 1 deletion(-)<br>
        <br>
        diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py<br>
        index 05d9fd6..a05a7fa 100755<br>
        --- a/scripts/relocate_sdk.py<br>
        +++ b/scripts/relocate_sdk.py<br>
        @@ -201,7 +201,7 @@ else:<br>
             new_prefix = sys.argv[1].encode()<br>
             new_dl_path = sys.argv[2].encode()<br>
        <br>
        -executables_list = sys.argv[3:]<br>
        +executables_list = sys.argv[2:]<br>
        <br>
         for e in executables_list:<br>
             perms = os.stat(e)[stat.ST_MODE]<br>
        --<br>
        1.7.10.4<br>
        <br>
        --<br>
        _______________________________________________<br>
        Openembedded-core mailing list<br>
        <a moz-do-not-send="true" href="javascript:;" onclick="_e(event,
          'cvml', 'Openembedded-core@lists.openembedded.org')">Openembedded-core@lists.openembedded.org</a><br>
        <a moz-do-not-send="true"
          href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
          target="_blank">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------030205010909040408050500--
