Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1U86EV-00068W-Fh
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 10:44:59 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1K9Sj0l020394
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Feb 2013 01:28:45 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Wed, 20 Feb 2013 01:28:44 -0800
Message-ID: <5124974D.2000908@windriver.com>
Date: Wed, 20 Feb 2013 17:28:45 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
References: <cover.1361338900.git.Qi.Chen@windriver.com>
	<5ef28960f6e00cda4b04bbe53399053704921d2d.1361338900.git.Qi.Chen@windriver.com>
	<13cf6700102.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
	<51247864.7000205@windriver.com>
	<CAC1BbcSWORfZ9x835DZ1f9oOdiqXFdGbFPYHNh3vTtmpdH-FHQ@mail.gmail.com>
In-Reply-To: <CAC1BbcSWORfZ9x835DZ1f9oOdiqXFdGbFPYHNh3vTtmpdH-FHQ@mail.gmail.com>
X-Originating-IP: [128.224.163.154]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 4/5] populate-volatile.sh: improve the handling of link config items
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
X-List-Received-Date: Wed, 20 Feb 2013 09:45:02 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/20/2013 05:18 PM, Bernhard Reutner-Fischer wrote:
> On 20 February 2013 08:16, ChenQi <Qi.Chen@windriver.com> wrote:
>> On 02/20/2013 03:10 PM, Bernhard Reutner-Fischer wrote:
>>> On 20 February 2013 06:55:33 <Qi.Chen@windriver.com> wrote:
>>>> From: Chen Qi <Qi.Chen@windriver.com>
>>>>
>>>> Previously, if there's a link config item in the config file like
>>>>
>>>>          l root root 1777 /tmp /var/tmp
>>>>
>>>> and /tmp has existed, the symlink will not be created correctly.
>>>>
>>>> Another example is the /run directory. If /run directory has been
>>>> created by some recipe or script before populate-volatile.sh runs,
>>>> the symlink of /run to /var/run will not be created correctly.
>>>>
>>>> This patch ensures that the system creates symlinks exactly as the
>>>> config file tells it.
>>>
>>> This one also has bugs in background handling, it seems.
>>
>> What's the bug?
> -                               link_file "${TSOURCE}" "${TNAME}" &
> -                       }
> +                       [ "${VERBOSE}" != "no" ] && echo "Creating
> link -${TNAME}- pointing to -${TSOURCE}-."
> +                       link_file "${TSOURCE}" "${TNAME}"
>
> missing '&' after the link_file.
Thanks. I'll resend out this patch.

>>
>>> Can't you massage stderr redirection when setting EXIT instead?
>>
>> Could you please be more specific?
> I meant EXEC.
> Can't you put the > /dev/null 2>&1 into the relevant parts of _all_
> the EXEC instead, in the whole series?
>
I don't think so :(
Only in case of running at rootfs time can we ignore the errors.

Best Regards,
Chen Qi

>>>> [YOCTO #3404]
>>>> [YOCTO #3406]
>



