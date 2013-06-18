Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A95BA60655
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 01:37:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5I1bLbQ011238
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Jun 2013 18:37:21 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Mon, 17 Jun 2013 18:37:21 -0700
Message-ID: <51BFB9D4.8080606@windriver.com>
Date: Tue, 18 Jun 2013 09:37:24 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <cover.1371447869.git.Qi.Chen@windriver.com>
	<4caf51c1d2225dc66aeef8326ba0616d97f7c691.1371447869.git.Qi.Chen@windriver.com>
	<CAP9ODKrhOpbGDXmU0Qhec5GJvzr1FFVv8TXdtT=AMJiOk-A2Rg@mail.gmail.com>
In-Reply-To: <CAP9ODKrhOpbGDXmU0Qhec5GJvzr1FFVv8TXdtT=AMJiOk-A2Rg@mail.gmail.com>
X-Originating-IP: [128.224.162.233]
Cc: qingtao.cao@windriver.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/9] busybox: remove the postinst part of the recipe
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
X-List-Received-Date: Tue, 18 Jun 2013 01:37:22 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 06/18/2013 01:52 AM, Otavio Salvador wrote:
> On Mon, Jun 17, 2013 at 2:49 AM,  <Qi.Chen@windriver.com> wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Remove the pkg_postinst_${PN} from this recipe, as it's redundant.
>> It basically wants to do the same thing as the update-alternatives
>> does. But it doesn't do it well.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> Most of patch 1 and 2 should be merged; here you should drop the
> postinst and convert these to the update-alternative way so we don't
> have the tree broken after this patch and allow for bisect  to be
> used.
Hi Otavio,

Maybe there's some misunderstanding here.
To be clear, patch 1 and patch 2 do two different things.
Patch 1 removes postinst, it has nothing to do with patch 2, which fix 
busybox.inc to support the FEATURE_INDIVIDUAL.
And after this patch (patch 1), the tree is not broken. The busybox 
still works as it has been working so far.

[
And I just did a simple test to confirm this. On the lastest master, I 
removed the postinst part of busybox.inc, and built a 
core-image-minimal, it worked out well. Here's some output.
root@qemuarm:~# ls -l /bin/ | grep busybox
lrwxrwxrwx    1 root     root            12 Jun 18 01:31 ash -> /bin/busybox
-rwsr-xr-x    1 root     root        556824 Jun 18 01:27 busybox
lrwxrwxrwx    1 root     root            12 Jun 18 01:31 cat -> /bin/busybox
lrwxrwxrwx    1 root     root            12 Jun 18 01:31 chattr -> 
/bin/busybox
lrwxrwxrwx    1 root     root            12 Jun 18 01:31 chgrp -> 
/bin/busybox
lrwxrwxrwx    1 root     root            12 Jun 18 01:31 chmod -> 
/bin/busybox
lrwxrwxrwx    1 root     root            12 Jun 18 01:31 chown -> 
/bin/busybox
lrwxrwxrwx    1 root     root            12 Jun 18 01:31 cp -> /bin/busybox
....
]

Best Regards,
Chen Qi

> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://projetos.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>
>


