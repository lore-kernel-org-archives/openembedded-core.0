Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1UAXv2-0005jH-TK
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 04:43:06 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1R3Qdrd029813
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Feb 2013 19:26:39 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.328.9;
	Tue, 26 Feb 2013 19:26:37 -0800
Message-ID: <512D7CEE.3090600@windriver.com>
Date: Wed, 27 Feb 2013 11:26:38 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1361783630.git.Qi.Chen@windriver.com>
	<cdf763e0896938a5189aa1694b6769f5b6d7190b.1361783630.git.Qi.Chen@windriver.com>
	<CAJTo0LbKDQNM2V02fsqBCG_RrBc517yGwVSBLi5nSnwFvs-_bw@mail.gmail.com>
In-Reply-To: <CAJTo0LbKDQNM2V02fsqBCG_RrBc517yGwVSBLi5nSnwFvs-_bw@mail.gmail.com>
X-Originating-IP: [128.224.163.154]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sysvinit: start .sh scripts correctly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Feb 2013 03:43:07 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/26/2013 07:04 PM, Burton, Ross wrote:
> On 26 February 2013 01:39,  <Qi.Chen@windriver.com> wrote:
>> -
>> -  case "$1" in
>> -       *.sh)
>> -               # Source shell script for speed.
>> -               (
>> -                       trap - INT QUIT TSTP
>> -                       scriptname=$1
>> -                       shift
>> -                       . $scriptname
>> -               )
>> -               ;;
>> -       *)
>> -               "$@"
>> -               ;;
>> -  esac
>> +  "$@"
>>     startup_progress
>>   }
> NACK.
>
> By "fix" you mean "remove the tested and proven optimisation"? The "if
> .sh use ." test was designed to speed up booting by not forking a new
> bash, and it's been demonstrated to have a noticeable difference on
> slower hardware.
>
> You can pass arguments to "." as this little test demonstrates:
>
> $ cat service.sh
> echo My arguments are "$@"
> $ . service.sh foo bar
> My arguments are foo bar
>
> The "shift" command shows that passing the arguments to the script was
> the intention, and a few lines of micro-test demonstrate that it
> *should* work:
>
> $ cat rc.sh
> startup() {
>      scriptname=$1
>      shift
>      . $scriptname
> }
> startup ./service.sh start
> $ busybox sh ./rc.sh
> My arguments are start
>
> So, something else is going wrong.
>
> Ross
>
>
Yes, you're right.
I absolutely made a mistake.

Thank you for pointing it out.

Best Regards,
Chen Qi


