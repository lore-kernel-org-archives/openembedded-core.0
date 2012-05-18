Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SVDyr-0005ZM-Po
	for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 05:35:55 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4I3KFhO017340
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 17 May 2012 20:25:48 -0700 (PDT)
Received: from [128.224.162.223] (128.224.162.223) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 17 May 2012 20:25:35 -0700
Message-ID: <4FB5C12B.6080106@windriver.com>
Date: Fri, 18 May 2012 11:25:31 +0800
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
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q4I3KFhO017340
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
X-List-Received-Date: Fri, 18 May 2012 03:35:55 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

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
>
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
Hi Jason,

Thank you to share your good experience with me very much.  I will apply=20
your methods to fix this bug.

Thanks
Yan


