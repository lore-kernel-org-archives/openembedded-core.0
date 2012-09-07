Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TA3C3-00070n-2g
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 20:22:15 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q87I9mmM003903
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Sep 2012 11:09:48 -0700 (PDT)
Received: from msp-dhcp24.wrs.com (172.25.34.24) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Fri, 7 Sep 2012 11:09:47 -0700
Message-ID: <504A386B.1050804@windriver.com>
Date: Fri, 7 Sep 2012 13:09:47 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120824 Thunderbird/15.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1346178028-2036-1-git-send-email-mark.asselstine@windriver.com>
	<5151998.0QU9eL25sN@yow-masselst-d1>
	<CAJTo0Lb0P23jieSdtFuTPn+e2h+L9MNXbfQDz4Y+D3bRxSOBYg@mail.gmail.com>
	<43444447.DkGKhXIaYr@yow-masselst-d1>
In-Reply-To: <43444447.DkGKhXIaYr@yow-masselst-d1>
Subject: Re: [PATCH V2] base-files: provide a mechanism to skip creation of the hostname file
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
X-List-Received-Date: Fri, 07 Sep 2012 18:22:15 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/30/12 12:20 PM, Mark Asselstine wrote:
> On August 28, 2012 21:11:47 Burton, Ross wrote:
>> On 28 August 2012 21:01, Mark Asselstine <mark.asselstine@windriver.com>
> wrote:
>>>> But surely this should be running very early in the boot, and a
>>>> DHCP-assigned name should be running afterwards?
>>>
>>> That hasn't been what I have observed, and doesn't cover the command line
>>> case. If you have an NFS root this would also not be the case as init will
>>> be run after the network is setup and root mounted.
>>
>> There was an implied "and if this isn't the case, a bug should be
>> filed".  I hadn't thought about NFS-root though.
>>
>> Ross
>
> Thanks for your thoughts on this.
>
> Is there anything else I can contribute here?

I found a bug with this patch.  If you are building with the deb packaging then 
the conffiles is set to /etc/hostname, but the file may not always be created... 
this causes a failure condition when generating .deb packages.

i.e.:

-CONFFILES_${PN} = "${sysconfdir}/fstab ${sysconfdir}/hostname"
+CONFFILES_${PN} = "${sysconfdir}/fstab ${@['', 
'${sysconfdir}/hostname'][(d.getVar('hostname', True) != '')]}"


> Mark
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



