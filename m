Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1S3PoK-0004s1-2o
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 11:34:04 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q22APWeH019677
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Mar 2012 02:25:32 -0800 (PST)
Received: from [128.224.162.196] (128.224.162.196) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 2 Mar 2012 02:25:32 -0800
Message-ID: <4F50A01B.9030909@windriver.com>
Date: Fri, 2 Mar 2012 18:25:31 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:9.0) Gecko/20111229 Thunderbird/9.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1330670625.git.liezhi.yang@windriver.com>
	<faf86eef0c803de04cb1a23041cce959a34ecee5.1330670625.git.liezhi.yang@windriver.com>
	<3F8819B5-BFD1-4A1B-AB0E-B54829635281@dominion.thruhere.net>
	<4F509DDF.3040103@windriver.com>
	<CC3FEF16-5F44-40D9-9A4D-A9C4ADADEF19@dominion.thruhere.net>
In-Reply-To: <CC3FEF16-5F44-40D9-9A4D-A9C4ADADEF19@dominion.thruhere.net>
Subject: Re: [PATCH 1/1] Fix libpam's chmod
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
X-List-Received-Date: Fri, 02 Mar 2012 10:34:04 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/02/2012 06:17 PM, Koen Kooi wrote:
>
> Op 2 mrt. 2012, om 11:15 heeft Robert Yang het volgende geschreven:
>
>>
>>
>> On 03/02/2012 04:42 PM, Koen Kooi wrote:
>>>
>>> Op 2 mrt. 2012, om 08:02 heeft Robert Yang het volgende geschreven:
>>>
>>>> The libpam's has an error when generating the rootfs:
>>>>
>>>> chmod: cannot access `/usr/sbin/unix_chkpwd': No such file or directory
>>>>
>>>> This is because the following code in libpam_1.1.5.bb:
>>>>
>>>> pkg_postinst_pam-plugin-unix () {
>>>>     # below is necessary to allow unix_chkpwd get user info from shadow file
>>>>     # on lsb images
>>>>     chmod 4755 ${sbindir}/unix_chkpwd
>>>> }
>>>>
>>>> This is to set the setuid permission for unix_chkpwd (the lsb test
>>>> requires this), but it lacks a "${D}", and we can do this in the install
>>>> stage.
>>>>
>>>> [YOCTO #2049]
>>>>
>>>> Signed-off-by: Robert Yang<liezhi.yang@windriver.com>
>>>> ---
>>>> meta/recipes-extended/pam/libpam_1.1.5.bb |    7 ++-----
>>>> 1 files changed, 2 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-extended/pam/libpam_1.1.5.bb b/meta/recipes-extended/pam/libpam_1.1.5.bb
>>>> index 283f477..8cddca9 100644
>>>> --- a/meta/recipes-extended/pam/libpam_1.1.5.bb
>>>> +++ b/meta/recipes-extended/pam/libpam_1.1.5.bb
>>>> @@ -85,10 +85,7 @@ do_install() {
>>>>
>>>> 	install -d ${D}${sysconfdir}/pam.d/
>>>> 	install -m 0644 ${WORKDIR}/pam.d/* ${D}${sysconfdir}/pam.d/
>>>> -}
>>>>
>>>> -pkg_postinst_pam-plugin-unix () {
>>>> -    # below is necessary to allow unix_chkpwd get user info from shadow file
>>>> -    # on lsb images
>>>> -    chmod 4755 ${sbindir}/unix_chkpwd
>>>> +    # The lsb requires unix_chkpwd has setuid permission
>>>> +    chmod 4755 ${D}${sbindir}/unix_chkpwd
>>>
>>> MIssing PR bump
>>>
>>
>> Thanks for your reply, but I'm sorry I don't what did you mean, I guess you mean
>> the Pull Request, it is in the cover letter:
>
> No, I meant: you change the output package, so you need to increase PR

Ah, got it, the PR field, I will send a V2.

// Robert


> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


