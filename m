Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 78EE4660F9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 17:23:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4GHNPHq018377
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 10:23:25 -0700 (PDT)
Received: from msp-dhcp29.wrs.com (172.25.34.29) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Fri, 16 May 2014 10:23:25 -0700
Message-ID: <5376498C.5060507@windriver.com>
Date: Fri, 16 May 2014 12:23:24 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <53762907.8060600@topic.nl>
In-Reply-To: <53762907.8060600@topic.nl>
Subject: Re: Living without shadow
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
X-List-Received-Date: Fri, 16 May 2014 17:23:27 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/16/14, 10:04 AM, Mike Looijmans wrote:
> Any package that wants to add user accounts (e.g. dbus) automatically
> installs the "shadow" package into the image. This appears to be done by
> adduser.bbclass.
>
> We want to keep it small, and can easily live without the shadow
> package. Busybox already provides adduser and similar commands, and also
> handles login etc. just fine. So I tried adding a line
> RPROVIDES_busybox+="shadow"
> to the busybox recipe. I would expect to have an alternative provider
> now, and no more forces installation of the big shadow.
>
> The result was much more surprising though. Letting busybox provide
> "shadow" resulted in failing to build the rootfs. The "adduser" command
> did not work on the host. This was very unexpected - does shadow deliver
> something into the sysroot that adduser.bbclass needs?
>
> How can I get rid of the shadow package?
>

Lets expand that briefly, from the current version of useradd.bbclass:

DEPENDS_append = "${USERADDDEPENDS}"
USERADDDEPENDS = " base-passwd shadow-native shadow-sysroot shadow"
USERADDDEPENDS_class-cross = ""
USERADDDEPENDS_class-native = ""
USERADDDEPENDS_class-nativesdk = ""

What this does is for target packages, base-passwd [the password file], 
shadow-native [tools needed to configure passwords at install time], 
shadow-sysroot [shadow components needed to update the sysroot, and shadow 
[target utilities] are added to the -depends-.

The DEPENDS are only build-time requirements, not runtime.

The system further requires RDEPENDS:

         # RDEPENDS setup
         rdepends = d.getVar("RDEPENDS_%s" % pkg, True) or ""
         rdepends += ' ' + d.getVar('MLPREFIX') + 'base-passwd'
         rdepends += ' ' + d.getVar('MLPREFIX') + 'shadow'
         # base-files is where the default /etc/skel is packaged
         rdepends += ' ' + d.getVar('MLPREFIX') + 'base-files'
         d.setVar("RDEPENDS_%s" % pkg, rdepends)

For any package that has a call to a groupadd, useradd or groupmems, those 
dependencies are added.  We can't install the package onto the target without 
base-passwd (passwd/group file), shadow (utilities needed by the package install 
scripting) and base-files (/etc/skel is needed to add new users) being installed.

So with that said, what is required in the end is something that honors the 
necessary 'groupadd', 'useradd' and 'groupmems' executables.  If bitbake can 
provide them, then your RPROVIDES_busybox = "shadow" should work fine.  (bitbake 
also provides 'su', may provide 'login', and 'chpasswd'.)

If you are getting rootfs creation issues, then I need a reference to the error 
messages to have an idea of what may be needed.

--Mark

