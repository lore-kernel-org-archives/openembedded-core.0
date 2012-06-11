Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SdvG8-0007HK-4I
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 05:25:40 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q5B3F4oG011068
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 10 Jun 2012 20:15:04 -0700 (PDT)
Received: from [128.224.163.142] (128.224.163.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Sun, 10 Jun 2012 20:15:03 -0700
Message-ID: <4FD562B6.8030800@windriver.com>
Date: Mon, 11 Jun 2012 11:15:02 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1339035261.git.liezhi.yang@windriver.com>
	<9dabcaeee29d64ea4b0a8a5d0f4a42ec9369ee8c.1339035261.git.liezhi.yang@windriver.com>
	<CAMKF1soOGR4zEFO93Oc=uNHqyLXasVs2C3wdRThkwgqJ7=4ztg@mail.gmail.com>
In-Reply-To: <CAMKF1soOGR4zEFO93Oc=uNHqyLXasVs2C3wdRThkwgqJ7=4ztg@mail.gmail.com>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/2] apt-get 0.7.14: hangs at runtime
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
X-List-Received-Date: Mon, 11 Jun 2012 03:25:40 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 06/10/2012 03:37 PM, Khem Raj wrote:
> On Wed, Jun 6, 2012 at 11:33 PM, Robert Yang<liezhi.yang@windriver.com>  wrote:
>> This patch had a little problem, it made a infinite loop:
>>
>> for (K = CmdL.FileList + 1; *K != 0; J++)
>>
>
> thats a typo. change J++ to K++ in above construct
>
>> But the value of "K" will nerver change, so the apt-get hangs, revert
>> this patch first, and will fix the problem in another patch.
>>
>> Note: Increment the PR from 11 to 12
>>
>> Revert "apt: Fix a latent bug exposed by gcc 4.7"
>
> I dont think you have to revert it.
>

Hi Khem,

I reverted it was because I thought that modified the patch was not a
good idea, thanks for your suggestion, I'll modify the patch directly
for such a case next time (this one has been merged:-)).

// Robert

>>
>> This reverts commit 9d526462fe97564652771812ad1d363e9962b1e3.
>>
>> [YOCTO #2488]
>>
>> Signed-off-by: Robert Yang<liezhi.yang@windriver.com>
>> ---
>>   .../apt/apt-0.7.14/remove-redeclaration.patch      |   57 --------------------
>>   meta/recipes-devtools/apt/apt_0.7.14.bb            |    6 +--
>>   2 files changed, 2 insertions(+), 61 deletions(-)
>>   delete mode 100644 meta/recipes-devtools/apt/apt-0.7.14/remove-redeclaration.patch
>>
>> diff --git a/meta/recipes-devtools/apt/apt-0.7.14/remove-redeclaration.patch b/meta/recipes-devtools/apt/apt-0.7.14/remove-redeclaration.patch
>> deleted file mode 100644
>> index 68cb0b0..0000000
>> --- a/meta/recipes-devtools/apt/apt-0.7.14/remove-redeclaration.patch
>> +++ /dev/null
>> @@ -1,57 +0,0 @@
>> -Fix build errors
>> -
>> -deb/deblistparser.cc: In member function 'virtual short unsigned int debListParser::VersionHash()':
>> -deb/deblistparser.cc:212:13: error: redeclaration of 'char* I'
>> -deb/deblistparser.cc:202:22: error: 'const char** I' previously declared here
>> -
>> -Upstream-Status: Backport
>> -Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> -Index: apt-0.7.14/apt-pkg/deb/deblistparser.cc
>> -===================================================================
>> ---- apt-0.7.14.orig/apt-pkg/deb/deblistparser.cc       2012-03-30 11:17:09.112456632 -0700
>> -+++ apt-0.7.14/apt-pkg/deb/deblistparser.cc    2012-03-30 11:25:40.484481643 -0700
>> -@@ -209,18 +209,18 @@
>> -       /* Strip out any spaces from the text, this undoes dpkgs reformatting
>> -          of certain fields. dpkg also has the rather interesting notion of
>> -          reformatting depends operators<  ->  <= */
>> --      char *I = S;
>> -+      char *J = S;
>> -       for (; Start != End; Start++)
>> -       {
>> -        if (isspace(*Start) == 0)
>> --          *I++ = tolower(*Start);
>> -+          *J++ = tolower(*Start);
>> -        if (*Start == '<'&&  Start[1] != '<'&&  Start[1] != '=')
>> --          *I++ = '=';
>> -+          *J++ = '=';
>> -        if (*Start == '>'&&  Start[1] != '>'&&  Start[1] != '=')
>> --          *I++ = '=';
>> -+          *J++ = '=';
>> -       }
>> -
>> --      Result = AddCRC16(Result,S,I - S);
>> -+      Result = AddCRC16(Result,S,J - S);
>> -    }
>> -
>> -    return Result;
>> -Index: apt-0.7.14/cmdline/apt-get.cc
>> -===================================================================
>> ---- apt-0.7.14.orig/cmdline/apt-get.cc 2012-03-30 11:28:56.048490824 -0700
>> -+++ apt-0.7.14/cmdline/apt-get.cc      2012-03-30 11:32:00.248499740 -0700
>> -@@ -1752,12 +1752,12 @@
>> -        if ((*Cache)[I].Install() == false)
>> -           continue;
>> -
>> --       const char **J;
>> --       for (J = CmdL.FileList + 1; *J != 0; J++)
>> --          if (strcmp(*J,I.Name()) == 0)
>> -+       const char **K;
>> -+       for (K = CmdL.FileList + 1; *K != 0; J++)
>> -+          if (strcmp(*K,I.Name()) == 0)
>> -               break;
>> -
>> --       if (*J == 0) {
>> -+       if (*K == 0) {
>> -           List += string(I.Name()) + " ";
>> -           VersionsList += string(Cache[I].CandVersion) + "\n";
>> -        }
>> diff --git a/meta/recipes-devtools/apt/apt_0.7.14.bb b/meta/recipes-devtools/apt/apt_0.7.14.bb
>> index 6354f8e..4055294 100644
>> --- a/meta/recipes-devtools/apt/apt_0.7.14.bb
>> +++ b/meta/recipes-devtools/apt/apt_0.7.14.bb
>> @@ -3,12 +3,10 @@ RDEPENDS_${PN} = "dpkg"
>>   LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
>>   require apt.inc
>>
>> -PR = "r11"
>> +PR = "r12"
>>
>>   SRC_URI += "file://nodoc.patch \
>> -            file://includes-fix.patch \
>> -            file://remove-redeclaration.patch \
>> -           "
>> +            file://includes-fix.patch "
>>
>>   SRC_URI[md5sum] = "19efa18fb1ef20c58b9b44e94258b814"
>>   SRC_URI[sha256sum] = "8fc06effaf8a4e4333308eedcdc6840f1c8056f2e924210f151dfc076bcd4045"
>> --
>> 1.7.1
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


