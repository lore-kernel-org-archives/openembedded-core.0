Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SVHr2-0000vH-Ll
	for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 09:44:05 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4I7Xx3x015391
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 18 May 2012 00:33:59 -0700 (PDT)
Received: from [128.224.162.223] (128.224.162.223) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 18 May 2012 00:33:58 -0700
Message-ID: <4FB5FB63.1030801@windriver.com>
Date: Fri, 18 May 2012 15:33:55 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Jason Wessel <jason.wessel@windriver.com>
References: <cover.1337162056.git.xiaofeng.yan@windriver.com>
	<a918712a769df875f9e59f7a5aa233b7316705c2.1337162056.git.xiaofeng.yan@windriver.com>
	<4FB38961.2000702@linux.intel.com> <4FB45BEF.6070204@windriver.com>
	<4FB4E8D7.2020808@windriver.com>
In-Reply-To: <4FB4E8D7.2020808@windriver.com>
X-Originating-IP: [128.224.162.223]
Cc: Zhenfeng.Zhao@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] ncurses: Disable parallel make
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 May 2012 07:44:05 -0000
Content-Type: multipart/alternative;
	boundary="------------050305040605070301080100"

--------------050305040605070301080100
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id q4I7Xx3x015391

On 2012=E5=B9=B405=E6=9C=8817=E6=97=A5 20:02, Jason Wessel wrote:
> On 05/16/2012 09:01 PM, Xiaofeng Yan wrote:
>> On 2012=E5=B9=B405=E6=9C=8816=E6=97=A5 19:02, Saul Wold wrote:
>>> On 05/16/2012 01:10 PM, xiaofeng.yan@windriver.com wrote:
>>>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>>>
>>>> Ncurses failure non-gplv3 build by race issue. So disable parallel \
>>>> make when building this package.
>>>>
>>> This is not the best approach as you disable PARALLEL_MAKE for both
>>> non-gplv3 and gplv3 versions. Further, we want to get rid of [M1]
>>> setting as much as possible, so this patch is not helping that.
>>>
>>> Did you try running on a large many core machine? It might help if yo=
u
>>> have some other builds going also to stress the machine.
>>>
>>> Sau!
>> Thanks for your reply. The most cores I have are eight. I also set
>> PARALLEL_MAKE=3Dj1000 and 10000. I think I need try to find new way fo=
r
>> fixing bugs.
>>
> Do you have an error file from a failed build (and ideally the failed b=
uild directory)?  Having diagnosed many problems like this in the past, i=
t is easiest to look for the failure case and add some sleep statement in=
 the Makefile to get it to trigger every time in the same way.
Hi jason,
The failed build information is in *Bug 2298*=20
<https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2298>.  The error=20
appear in the stage of install, not configure and compiling.
Do you any ideas after reading bug information?

Thanks
Yan



> The two most common problems are:
>    1) autoconf re-runs due to time stamps or partially patched files
>    2) a generated file is reported as missing
>
> In the first case it, it will often be some error with a .h missing or =
some other strange error about a header in the compilation and it is a re=
sult of only having a partial file because it is getting regenerated at t=
he time.
>
> In the second case you just find the file's rule in the Makefile and ad=
d an if statement in the Make target goal if it is a multi-object rule to=
 look for the problem object and sleep a bit.  I have yet to see a case I=
 couldn't reproduce the results by following the strategy of some forcing=
 some extra delay.  You probably won't have to go to this length, but the=
re was one time I even wrote a C wrapper around a command to add some sle=
ep controlled by an environment variable to prove config.h was getting re=
moved and regenerated.   Example:
>
> #include<stdio.h>
> #include<stdlib.h>
> #include<string.h>
> #include<unistd.h>
>
> int main(int argc, char *const argv[]) {
>     char *lookfor;
>     if (argc>=3D 2) {
>       lookfor =3D getenv("LOOKFORSLEEP");
>       if (lookfor&&  strcmp(argv[1], lookfor) =3D=3D 0) {
>           if (argc>=3D 3&&  strcmp(argv[2], "config.h") =3D=3D 0) {
>              unlink("config.h");
>              printf("Special sleep on command %s\n", lookfor);
>              sleep(2);
>           }
>       }
>     }
>     execv("/bin/sh", argv);
>     return 0;
> }
>
>
> Best of luck,
> Jason.
>


--------------050305040605070301080100
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id q4I7Xx3x015391

<html>
  <head>
    <meta content=3D"text/html; charset=3DUTF-8" http-equiv=3D"Content-Ty=
pe">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    On 2012=E5=B9=B405=E6=9C=8817=E6=97=A5 20:02, Jason Wessel wrote:
    <blockquote cite=3D"mid:4FB4E8D7.2020808@windriver.com" type=3D"cite"=
>
      <pre wrap=3D"">On 05/16/2012 09:01 PM, Xiaofeng Yan wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">On 2012=E5=B9=B405=E6=9C=8816=E6=97=A5 19:02, Saul=
 Wold wrote:
</pre>
        <blockquote type=3D"cite">
          <pre wrap=3D"">On 05/16/2012 01:10 PM, <a class=3D"moz-txt-link=
-abbreviated" href=3D"mailto:xiaofeng.yan@windriver.com">xiaofeng.yan@win=
driver.com</a> wrote:
</pre>
          <blockquote type=3D"cite">
            <pre wrap=3D"">From: Xiaofeng Yan<a class=3D"moz-txt-link-rfc=
2396E" href=3D"mailto:xiaofeng.yan@windriver.com">&lt;xiaofeng.yan@windri=
ver.com&gt;</a>

Ncurses failure non-gplv3 build by race issue. So disable parallel \
make when building this package.

</pre>
          </blockquote>
          <pre wrap=3D"">This is not the best approach as you disable PAR=
ALLEL_MAKE for both=20
non-gplv3 and gplv3 versions. Further, we want to get rid of [M1]=20
setting as much as possible, so this patch is not helping that.

Did you try running on a large many core machine? It might help if you=20
have some other builds going also to stress the machine.

Sau!
</pre>
        </blockquote>
        <pre wrap=3D"">Thanks for your reply. The most cores I have are e=
ight. I also set=20
PARALLEL_MAKE=3Dj1000 and 10000. I think I need try to find new way for=20
fixing bugs.

</pre>
      </blockquote>
      <pre wrap=3D"">
Do you have an error file from a failed build (and ideally the failed bui=
ld directory)?  Having diagnosed many problems like this in the past, it =
is easiest to look for the failure case and add some sleep statement in t=
he Makefile to get it to trigger every time in the same way.=20
</pre>
    </blockquote>
    Hi jason,<br>
    The failed build information is in
    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF=
-8">
    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF=
-8">
    <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2298"
      style=3D"color: rgb(51, 51, 51); font-family: Verdana, sans-serif;
      font-size: 17px; font-style: normal; font-variant: normal;
      font-weight: bold; letter-spacing: normal; line-height: normal;
      orphans: 2; text-align: -webkit-auto; text-indent: 0px;
      text-transform: none; white-space: normal; widows: 2;
      word-spacing: 0px; -webkit-text-size-adjust: auto;
      -webkit-text-stroke-width: 0px; background-color: rgb(208, 208,
      208); "><b>Bug=C2=A02298</b></a>.=C2=A0 The error appear in the sta=
ge of
    install, not configure and compiling.<br>
    Do you any ideas after reading bug information?<br>
    <br>
    Thanks<br>
    Yan<br>
    <span style=3D"color: rgb(0, 0, 0); font-family: Verdana, sans-serif;
      font-size: 17px; font-style: normal; font-variant: normal;
      font-weight: bold; letter-spacing: normal; line-height: normal;
      orphans: 2; text-align: -webkit-auto; text-indent: 0px;
      text-transform: none; white-space: normal; widows: 2;
      word-spacing: 0px; -webkit-text-size-adjust: auto;
      -webkit-text-stroke-width: 0px; background-color: rgb(208, 208,
      208); display: inline !important; float: none; "><span
        class=3D"Apple-converted-space"><br>
      </span></span><br>
    <br>
    <blockquote cite=3D"mid:4FB4E8D7.2020808@windriver.com" type=3D"cite"=
>
      <pre wrap=3D"">
The two most common problems are:
  1) autoconf re-runs due to time stamps or partially patched files
  2) a generated file is reported as missing

In the first case it, it will often be some error with a .h missing or so=
me other strange error about a header in the compilation and it is a resu=
lt of only having a partial file because it is getting regenerated at the=
 time.

In the second case you just find the file's rule in the Makefile and add =
an if statement in the Make target goal if it is a multi-object rule to l=
ook for the problem object and sleep a bit.  I have yet to see a case I c=
ouldn't reproduce the results by following the strategy of some forcing s=
ome extra delay.  You probably won't have to go to this length, but there=
 was one time I even wrote a C wrapper around a command to add some sleep=
 controlled by an environment variable to prove config.h was getting remo=
ved and regenerated.   Example:

#include &lt;stdio.h&gt;
#include &lt;stdlib.h&gt;
#include &lt;string.h&gt;
#include &lt;unistd.h&gt;

int main(int argc, char *const argv[]) {
   char *lookfor;
   if (argc &gt;=3D 2) {=20
     lookfor =3D getenv("LOOKFORSLEEP");
     if (lookfor &amp;&amp; strcmp(argv[1], lookfor) =3D=3D 0) {
         if (argc &gt;=3D 3 &amp;&amp; strcmp(argv[2], "config.h") =3D=3D=
 0) {
            unlink("config.h");
            printf("Special sleep on command %s\n", lookfor);
            sleep(2);
         }
     }
   }
   execv("/bin/sh", argv);
   return 0;
}


Best of luck,
Jason.

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------050305040605070301080100--
