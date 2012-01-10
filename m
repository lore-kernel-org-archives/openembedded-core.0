Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1RkZFA-0003co-6O
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 11:47:52 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0AAeLk1011828
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Jan 2012 02:40:21 -0800 (PST)
Received: from [128.224.162.196] (128.224.162.196) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 10 Jan 2012 02:40:21 -0800
Message-ID: <4F0C1593.90203@windriver.com>
Date: Tue, 10 Jan 2012 18:40:19 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1325318523.git.liezhi.yang@windriver.com>
	<47d6afe044383d6ca97c3972a25663eda145a56c.1325318523.git.liezhi.yang@windriver.com>
	<1325863359.20759.127.camel@ted>
In-Reply-To: <1325863359.20759.127.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] V2 Incremental image generation(rpm based rootfs)
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
X-List-Received-Date: Tue, 10 Jan 2012 10:47:52 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Richard,

Please see my comments inline ...

On 01/06/2012 11:22 PM, Richard Purdie wrote:
> On Sat, 2011-12-31 at 16:10 +0800, Robert Yang wrote:
>> Incremental image generation, the rootfs would be totally removed and
>> re-created in the second generation by default, but with INC_IMAGE_GEN =
>> "1", the rootfs would be kept, and will do update(remove/add some pkgs)
>> on it.
>> it.
>>
>> This only for the rpm based rootfs, I don't know whether we also need
>> this for ipk or deb  based rootfs.
>
> As Koen points out, this should be called INC_RPM_IMAGE_GEN since it
> only works for rpm at present. It would be good to make this work on the
> other package backends. If we keep the generic variable name, the other
> package backends could error out saying they don't support it.
>

I did a rough investigation on deb these days, it seems not easy to do in
M2, so I'd like to make it work for both deb and ipk in M3. I will change the
name to INC_RPM_IMAGE_GEN at present, and send a V3 sooner.

>> [YOCTO #1651]
>>
>> Signed-off-by: Robert Yang<liezhi.yang@windriver.com>
>> ---

>> +
>> +        # Attempt to remove unwanted pkgs, the scripts(pre, post, etc.) has not
>> +        # been run by now, so don't have to run them(preun, postun, etc.) when
>> +        # erase the pkg
>
> Really? I'd have thought it possible the scripts have run during the
> previous do_rootfs?
>

Yes, I think so, I think these post scripts are put in /etc/rpm-postinsts/,
and will be run when the system starts at the first time. The best solution
is that remove the script when "rpm -e", but it is hard to know which pkg
owns which script, so I just prevent running the preun and postun when
"rpm -e", I think this is acceptable since the INC_RPM_IMAGE_GEN is not
suggested in the productive rootfs.

// Robert

> Otherwise the patch looks reasonable to me.
>
> Cheers,
>
> Richard
>
>
>


