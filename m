Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RR7ta-0001va-Ex
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 20:45:14 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAHJclID017002
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 11:38:47 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 17 Nov 2011 11:38:47 -0800
Message-ID: <4EC562C6.8000905@windriver.com>
Date: Thu, 17 Nov 2011 13:38:46 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1321496999.1264.24.camel@localhost.localdomain>
	<CAEsOVNdL3bTKA9rv6p9SEpvoY+a3b5y6Ftn=ySMVdgkW3nMm3w@mail.gmail.com>
	<20111117085730.GA4551@mail.familie-heinold.de>
	<1321521168.1264.43.camel@localhost.localdomain>
In-Reply-To: <1321521168.1264.43.camel@localhost.localdomain>
Subject: Re: how to exclude files when packaging?
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
X-List-Received-Date: Thu, 17 Nov 2011 19:45:14 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/11 3:12 AM, Ni Qingliang wrote:
> I still think that the 'exclude" feature would be better.:)

IMHO an exclude function would simply be an automated rm -f <list> at the end of 
the install process.

It should be fairly easy to implement this if someone thinks it's a better idea 
then making individual recipes run a rm -f of their own.

--Mark

> On Thu, 2011-11-17 at 16:57 +0800, Henning Heinold wrote:
>> On Thu, Nov 17, 2011 at 08:14:06AM +0000, McClintock Matthew-B29882 wrote:
>>> On Wed, Nov 16, 2011 at 8:29 PM, Ni Qingliang
>>> <niqingliang@insigma.com.cn>  wrote:
>>>> Hello, All:
>>>>         I'm working on opensaf, wrote a bb file for it,
>>>> and found that the FILES_${PN} has included /usr/lib/${PN}/*.
>>>> but there are some .a and .so(symlink) in /usr/lib/${PN}, which will
>>>> result QA issue.
>>>>         how to exclude some files (e.g. *.a, *.so) in FILES_${PN}?
>>>>
>>>>         there are some elf in /usr/lib/${PN} whose prefix is not 'lib', so if
>>>> no 'exclude' feature, I must redefine FILES_${PN} like this:
>>>>         FILES_${PN} = "/usr/lib/${PN}/*.so.* \
>>>>                        /usr/lib/${PN}/saf* \
>>>>                        /usr/lib/${PN}/open* \
>>>>                        /usr/lib/${PN}/immload \
>>>>                        /usr/lib/${PN}/nid_tipc \
>>>>                        /usr/lib/${PN}/smf* \
>>>>                        /usr/lib/${PN}/clc-cli/*"
>>>
>>> Explicitly list what you want in FILES_${PN}
>>>
>>> FILES_${PN} = /usr/lib/${PN}/saf
>>>
>>> Make another PACKAGE for other files
>>>
>>> PACKAGES =+ ${PN}-misc
>>> FILES_${PN}-misc = /usr/lib/${PN}/saf
>>>
>>> Maybe someone else can chime in if there is a way to mask certain files...
>>
>> No,
>>
>> QA would always complain. For all files you do not want to package make a do_install_append()
>> and remove them inside this function.
>>
>> Another solution would be to tweak the buildsystem of the software, not to install the unwanted
>> files.
>>
>> Bye Henning
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



