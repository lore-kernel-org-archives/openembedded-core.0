Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RDhqF-000846-DY
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Oct 2011 21:18:19 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9BJCaNt000791
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2011 12:12:36 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 11 Oct 2011 12:12:36 -0700
Message-ID: <4E949523.9060705@windriver.com>
Date: Tue, 11 Oct 2011 14:12:35 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <DDA1B8C5-0867-406F-BB88-0D33B7501900@dominion.thruhere.net>
	<4E9492E7.3070301@windriver.com>
In-Reply-To: <4E9492E7.3070301@windriver.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	p9BJCaNt000791
Subject: Re: How to overlay files/fs-perms.txt?
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
X-List-Received-Date: Tue, 11 Oct 2011 19:18:19 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

On 10/11/11 2:03 PM, Mark Hatle wrote:
> On 10/11/11 5:42 AM, Koen Kooi wrote:
>> Hi,
>>
>> In angstrom we have base-files overlayed to clean out /var and files/f=
s-perms.txt is getting in the way of that:
>>
>> koen@dominion:/OE/tentacle/sources/openembedded-core/meta$ grep locals=
tate files/fs-perms.txt=20
>> ${localstatedir}/cache	link	volatile/cache
>> ${localstatedir}/run	link	volatile/run
>> ${localstatedir}/log	link	volatile/log
>> ${localstatedir}/lock	link	volatile/lock
>> ${localstatedir}/tmp	link	volatile/tmp
>>
>> In angstrom those aren't symlinks anymore, but tmpfs bind mounts manag=
ed by systemd.

Sorry to reply to my reply... but I just realized I left one thing out.

Follow the items below, and add entries for each of the links and list th=
en as
directory types instead.  The code will load the files in order.. any dup=
licates
the last setting is what is used.

--Mark

>> So, how doI overlay that file in this oe-core layer universe?
>=20
> This came up recently in regards to the Yocto documentation.  Below is =
the
> snipped of conversation we had working on docs:
>=20
>>> I was discussing the fs-perms.txt file and the FILESYSTEM_PERMS_TABLE=
S variable
>>> with Paul.  We got the point of user-scenarios.  Paul said that he wo=
uld
>>> recommend not setting the variable at all and just letting it default=
 to our
>>> fs-perms.txt file.  At which point I asked why have the variable then=
?  Paul
>>> pointed me off to you at that point.
>>>
>> Reasons to set it.
>>
>> You have custom files/directories in your layer and need to specify th=
em via a
>> custom fs-perms.txt file.  (More then one can be specified...)  The fi=
le (or
>> files) is "distribution specific".  I.e. the distribution the develope=
r is
>> creating needs a consistent fs-perms.txt across the entire work produc=
t.  For
>> directories shared between packages, that use non-standard permissions=
, owners
>> and/or groups, this is the way to synchronize the information.  (Note,=
 it's
>> better to sync within the packages themselves, but that is not always =
possible
>> to do.. primarily for the core package set.)
>>
>>> So what I am trying to understand here is how a customer would go abo=
ut using
>>> their own fs-perms.txt file.  Since we have the FILESYSTEM_PERMS_TABL=
ES variable
>>> I presume someone can set it to point to an fs-perms.txt file of thei=
r own.  Can
>>> tell me how they do that with some answers to the following?
>>>
>> FILESYSTEM_PERMS_TABLES is by default "files/fs-perms.txt".  One or mo=
re file
>> can be added to this list.  Each file listed will be scanned for via t=
he BBPATH.
>>  So you might end up with a "files/intel-perms.txt".  This could be an=
 Intel
>> specific version of the file.  Or set it to "files/fs-perms.txt
>> files/intel-perms.txt".  In this case it will use BOTH the default and=
 the newly
>> mentioned intel-perms.txt.
>>
>>> =B7         They create their own file following the syntax of the fs=
-perms.txt
>>> file we supply and put it anywhere they want?
>> The path specified must be within the BBPATH.
>>
>>> =B7         They edit the existing fs-perms.txt file we supply?  (pro=
bably not a
>>> good idea but thought I would ask)
>> It is best for them to supply their own file and include it in additio=
n to the
>> default file -- or completely replace the stock file.  (editing the st=
ock
>> version makes long term maintenance more difficult if we need to make =
changes to
>> it in the future.)
>>
>>> =B7         Where do they set the FILESYSTEM_PERMS_TABLES variable?  =
We set it in
>>> a place that they should not edit.
>> local.conf or any other place where bitbake variables can be set.
>>
>>> =B7         Is the FILESYSTEM_PERMS-TABLES variable something that sh=
ould just
>>> remain hidden?
>> I doubt it will be useful for general purpose stuff.. It's really for
>> distribution creators, more then distribution "users".  Most of our (Y=
octo and
>> OE-Core) user base are "users".  They use what we give them as a basis=
 for their
>> work, and then add to it.  A distribution creator is someone who is go=
ing to
>> potentially chance the rules of the filesystem and where things belong=
 to suit
>> their (or their customers) needs.
>=20
> Hopefully this helps.
>=20
> --Mark
>=20
>> regards,
>>
>> Koen
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



