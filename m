Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QbDtM-0000D9-Fx
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 17:38:28 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5RFYleW017366
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2011 08:34:47 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 27 Jun 2011 08:34:47 -0700
Message-ID: <4E08A316.7060609@windriver.com>
Date: Mon, 27 Jun 2011 10:34:46 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1309188064.git.mark.hatle@windriver.com>
	<BCF3715C-89A9-4B7A-9278-6D589F8223B1@dominion.thruhere.net>
In-Reply-To: <BCF3715C-89A9-4B7A-9278-6D589F8223B1@dominion.thruhere.net>
Subject: Re: [PATCH 0/2] Ensure a reasonable umask, and fix up permissions (V2)
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
X-List-Received-Date: Mon, 27 Jun 2011 15:38:28 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/27/11 10:31 AM, Koen Kooi wrote:
> 
> Op 27 jun 2011, om 17:26 heeft Mark Hatle het volgende geschreven:
> 
>> Revised the fixup_perms function in package.bbclass.  Change to using a
>> class based approach for the individual permissions entries.
>>
>> Add support for directory linkages.
>>
>> Add entries to match base-files recipe in the fs-perms.txt.
>>
>> (umask commit is unchanged, resending due to time since last sent)
>>
>> ----
>>
>> V1 log below
>>
>> Add a new function that is responsible for fixing directory and file
>> permissions, owners and groups during the packaging process.  This will fix
>> various issues where two packages may create the same directory and end up
>> with different permissions, owner and/or group.
>>
>> The issue being resolved is that if two packages conflict in their ownership
>> of a directory, the first installed into the rootfs sets the permissions.
>> This leads to a least potentially non-deterministic filesystems, at worst
>> security defects.
>>
>> The user can specify their own settings via the configuration files
>> specified in FILESYSTEM_PERMS_TABLES.  If this is not defined, it will
>> fall back to loading files/fs-perms.txt from BBPATH.  The format of this
>> file is documented within the file.
>>
>> By default all of the system directories, specified in bitbake.conf, will
>> be fixed to be 0755, root, root.
>>
>> The fs-perms.txt contains a few default entries to correct documentation,
>> locale, headers and debug sources.  It was discovered these are often
>> incorrect due to being directly copied from the build user environment.
>>
>> Also tweak a couple of warnings to provide more diagnostic information.
> 
> Does this rely on the umask feature in bitbake master? If so, we should check the minumum bitbake requirements again

It relies upon it, however no failures will occur if bitbake master doesn't
support the umask control.  (Of course then the user's umask is inherited.)

--Mark

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



