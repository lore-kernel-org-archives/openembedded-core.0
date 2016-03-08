Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D570560119
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 08:09:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2889TsF022004
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 8 Mar 2016 00:09:29 -0800
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 8 Mar 2016 00:09:28 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Zhenhua Luo
	<zhenhua.luo@nxp.com>
References: <1457014986.25131.69.camel@linuxfoundation.org>
	<DB3PR04MB068422B10C54A685417DCE3AEEBE0@DB3PR04MB0684.eurprd04.prod.outlook.com>
	<1457086698.2804.9.camel@linuxfoundation.org>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <56DE88AD.7090902@windriver.com>
Date: Tue, 8 Mar 2016 16:09:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1457086698.2804.9.camel@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Status of M3
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
X-List-Received-Date: Tue, 08 Mar 2016 08:09:32 -0000
Content-Type: multipart/alternative;
	boundary="------------060103000400010203040501"

--------------060103000400010203040501
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/04/2016 06:18 PM, Richard Purdie wrote:
> On Fri, 2016-03-04 at 09:41 +0000, Zhenhua Luo wrote:
>>> * meta-fsl-ppc breaks on eudev change (patch pending)
>>> * meta-fsl-ppc breakage blocks AB artefact publishing
>> [Luo Zhenhua-B19537] The eudev patch is merged, http://git.yoctoproje
>> ct.org/cgit/cgit.cgi/meta-fsl
>> -ppc/commit/?id=2642cf5e8a6f8d11603acf016b8c075ebce00ec0, is there
>> any other blocker issue?
> Thanks, I appreciate getting that sorted!
>
> Unfortunately there is something else not quite right with meta-fsl
> -ppc:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-fsl-ppc/buil
> ds/667

Hi Richard,

In the log, we have do_configure failed on python3:
...
| checking for the platform triplet based on compiler characteristics... 
powerpc-linux-gnuspe
| configure: error: internal configure error for the platform triplet, 
please file a bug report
| NOTE: The following config.log files may provide further information.
...


vim configure.ac in python3 source
...
  852 if test x$PLATFORM_TRIPLET != x && test x$MULTIARCH != x; then
  853   if test x$PLATFORM_TRIPLET != x$MULTIARCH; then
  854     AC_MSG_ERROR([internal configure error for the platform 
triplet, please file a bug report])
  855   fi
  856 fi
...

In this case, PLATFORM_TRIPLET is powerpc-linux-gnuspe, and MULTIARCH is
MULTIARCH=$($CC --print-multiarch 2>/dev/null), and both of them are not 
equivalent.

On my local build with MACHINE = "qemux86-64", the MULTIARCH is empty.

On my local build with MACHINE = "p1022ds", $CC --print-multiarch
powerpc-linux-gnuspev1

Extra 'v1' casued the failure.

I am going to see what happen on 'v1', file [YOCTO #9226] to trace it

//Hongxu

> Seems something is not working in python3 do_configure? Everything else
> is building python3 fine so not sure what is wrong there.
>
> Cheers,
>
> Richard


--------------060103000400010203040501
Content-Type: text/html; charset="windows-1252"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 03/04/2016 06:18 PM, Richard Purdie
      wrote:<br>
    </div>
    <blockquote cite="mid:1457086698.2804.9.camel@linuxfoundation.org"
      type="cite">
      <pre wrap="">On Fri, 2016-03-04 at 09:41 +0000, Zhenhua Luo wrote:
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="">* meta-fsl-ppc breaks on eudev change (patch pending)
* meta-fsl-ppc breakage blocks AB artefact publishing
</pre>
        </blockquote>
        <pre wrap="">[Luo Zhenhua-B19537] The eudev patch is merged, <a class="moz-txt-link-freetext" href="http://git.yoctoproje">http://git.yoctoproje</a>
ct.org/cgit/cgit.cgi/meta-fsl
-ppc/commit/?id=2642cf5e8a6f8d11603acf016b8c075ebce00ec0, is there
any other blocker issue? 
</pre>
      </blockquote>
      <pre wrap="">
Thanks, I appreciate getting that sorted! 

Unfortunately there is something else not quite right with meta-fsl
-ppc:

<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/main/builders/nightly-fsl-ppc/buil">https://autobuilder.yoctoproject.org/main/builders/nightly-fsl-ppc/buil</a>
ds/667
</pre>
    </blockquote>
    <br>
    Hi Richard,<br>
    <br>
    In the log, we have do_configure failed on python3:<br>
    ...<br>
    | checking for the platform triplet based on compiler
    characteristics... powerpc-linux-gnuspe<br>
    | configure: error: internal configure error for the platform
    triplet, please file a bug report<br>
    | NOTE: The following config.log files may provide further
    information.<br>
    ...<br>
    <br>
    <meta http-equiv="content-type" content="text/html;
      charset=windows-1252">
    <br>
    vim configure.ac in python3 source<br>
    ...<br>
     852 if test x$PLATFORM_TRIPLET != x &amp;&amp; test x$MULTIARCH !=
    x; then<br>
     853   if test x$PLATFORM_TRIPLET != x$MULTIARCH; then<br>
     854     AC_MSG_ERROR([internal configure error for the platform
    triplet, please file a bug report])<br>
     855   fi<br>
     856 fi<br>
    ...<br>
    <br>
    In this case, PLATFORM_TRIPLET is powerpc-linux-gnuspe, and
    MULTIARCH is<br>
    MULTIARCH=$($CC --print-multiarch 2&gt;/dev/null), and both of them
    are not equivalent.<br>
    <br>
    On my local build with MACHINE = "qemux86-64", the MULTIARCH is
    empty.<br>
    <br>
    On my local build with MACHINE = "p1022ds", $CC --print-multiarch<br>
    powerpc-linux-gnuspev1<br>
    <br>
    Extra 'v1' casued the failure.<br>
    <br>
    I am going to see what happen on 'v1', file [YOCTO #9226] to trace
    it<br>
    <br>
    //Hongxu<br>
    <br>
    <blockquote cite="mid:1457086698.2804.9.camel@linuxfoundation.org"
      type="cite">
      <pre wrap="">
Seems something is not working in python3 do_configure? Everything else
is building python3 fine so not sure what is wrong there.

Cheers,

Richard
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------060103000400010203040501--
