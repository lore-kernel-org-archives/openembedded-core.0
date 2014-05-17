Return-Path: <mike.looijmans@topic.nl>
Received: from smtp09.online.nl (unknown [194.134.42.54])
	by mail.openembedded.org (Postfix) with ESMTP id 346326028A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 May 2014 06:41:29 +0000 (UTC)
Received: from smtp09.online.nl (localhost [127.0.0.1])
	by smtp09.online.nl (Postfix) with ESMTP id E600F1E6FB;
	Sat, 17 May 2014 08:41:29 +0200 (CEST)
Received: from [192.168.1.10] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp09.online.nl (Postfix) with ESMTP;
	Sat, 17 May 2014 08:41:29 +0200 (CEST)
Message-ID: <53770499.50805@topic.nl>
Date: Sat, 17 May 2014 08:41:29 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <53762907.8060600@topic.nl> <5376498C.5060507@windriver.com>
In-Reply-To: <5376498C.5060507@windriver.com>
X-Online-Scanned: by Cloudmark authority (on smtp09.online.nl)
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
X-List-Received-Date: Sat, 17 May 2014 06:41:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/16/2014 07:23 PM, Mark Hatle wrote:
> On 5/16/14, 10:04 AM, Mike Looijmans wrote:
>> Any package that wants to add user accounts (e.g. dbus) automatically
>> installs the "shadow" package into the image. This appears to be done by
>> adduser.bbclass.
>>
>> We want to keep it small, and can easily live without the shadow
>> package. Busybox already provides adduser and similar commands, and also
>> handles login etc. just fine. So I tried adding a line
>> RPROVIDES_busybox+="shadow"
>> to the busybox recipe. I would expect to have an alternative provider
>> now, and no more forces installation of the big shadow.
>>
>> The result was much more surprising though. Letting busybox provide
>> "shadow" resulted in failing to build the rootfs. The "adduser" command
>> did not work on the host. This was very unexpected - does shadow deliver
>> something into the sysroot that adduser.bbclass needs?
>>
>> How can I get rid of the shadow package?
>>
>
> Lets expand that briefly, from the current version of useradd.bbclass:
>
> DEPENDS_append = "${USERADDDEPENDS}"
> USERADDDEPENDS = " base-passwd shadow-native shadow-sysroot shadow"
> USERADDDEPENDS_class-cross = ""
> USERADDDEPENDS_class-native = ""
> USERADDDEPENDS_class-nativesdk = ""
>
> What this does is for target packages, base-passwd [the password file],
> shadow-native [tools needed to configure passwords at install time],
> shadow-sysroot [shadow components needed to update the sysroot, and
> shadow [target utilities] are added to the -depends-.
>
> The DEPENDS are only build-time requirements, not runtime.
>
> The system further requires RDEPENDS:
>
>          # RDEPENDS setup
>          rdepends = d.getVar("RDEPENDS_%s" % pkg, True) or ""
>          rdepends += ' ' + d.getVar('MLPREFIX') + 'base-passwd'
>          rdepends += ' ' + d.getVar('MLPREFIX') + 'shadow'
>          # base-files is where the default /etc/skel is packaged
>          rdepends += ' ' + d.getVar('MLPREFIX') + 'base-files'
>          d.setVar("RDEPENDS_%s" % pkg, rdepends)
>
> For any package that has a call to a groupadd, useradd or groupmems,
> those dependencies are added.  We can't install the package onto the
> target without base-passwd (passwd/group file), shadow (utilities needed
> by the package install scripting) and base-files (/etc/skel is needed to
> add new users) being installed.
>
> So with that said, what is required in the end is something that honors
> the necessary 'groupadd', 'useradd' and 'groupmems' executables.  If
> bitbake can provide them, then your RPROVIDES_busybox = "shadow" should
> work fine.  (bitbake also provides 'su', may provide 'login', and
> 'chpasswd'.)
>
> If you are getting rootfs creation issues, then I need a reference to
> the error messages to have an idea of what may be needed.
>

At the end I see this:

Collected errors:
  * preinst_configure: Aborting installation of dbus-1.
  * opkg_install_cmd: Cannot install package libavahi-client3.
  * preinst_configure: Aborting installation of rpcbind.
  * opkg_install_cmd: Cannot install package packagegroup-base.
  * preinst_configure: Aborting installation of rpcbind.
  * opkg_install_cmd: Cannot install package nfs-utils-client.
  * preinst_configure: Aborting installation of avahi-daemon.
  * opkg_install_cmd: Cannot install package avahi-daemon.

The logs seems to be "interlaced", but here's a summary of the things I 
cound find. If you want, I can send the full log.


Downloading 
file:/media/work/openpli-next/build/tmp/deploy/ipk/mips32el/base-passwd_3.5.29-r0_mips32el.ipk.
  Removing any system startup links for dbus-1 ...
Running groupadd commands...
NOTE: Performing groupadd with [--root 
/media/work/openpli-next/build/tmp/work/et10000-oe-linux/my-image/1.0-r0/rootfs 
-r netdev] and 10 times of retry
WARNING: groupadd command did not succeed. Retrying...
WARNING: groupadd command did not succeed. Retrying...
WARNING: groupadd command did not succeed. Retrying...
WARNING: groupadd command did not succeed. Retrying...
WARNING: groupadd command did not succeed. Retrying...
WARNING: groupadd command did not succeed. Retrying...
WARNING: groupadd command did not succeed. Retrying...
WARNING: groupadd command did not succeed. Retrying...
WARNING: groupadd command did not succeed. Retrying...
WARNING: groupadd command did not succeed. Retrying...
ERROR: Tried running groupadd command 10 times without scucess, giving up

  Removing any system startup links for rpcbind ...
Running useradd commands...
NOTE: Performing useradd with [--root 
/media/work/openpli-next/build/tmp/work/et10000-oe-linux/my-image/1.0-r0/rootfs 
--system --no-create-home                        --shell /bin/false 
--user-group rpc] and 10 times of retry
WARNING: useradd command did not succeed. Retrying...
WARNING: useradd command did not succeed. Retrying...
WARNING: useradd command did not succeed. Retrying...
WARNING: useradd command did not succeed. Retrying...
WARNING: useradd command did not succeed. Retrying...
WARNING: useradd command did not succeed. Retrying...
WARNING: useradd command did not succeed. Retrying...
WARNING: useradd command did not succeed. Retrying...
WARNING: useradd command did not succeed. Retrying...
WARNING: useradd command did not succeed. Retrying...
ERROR: Tried running useradd command 10 times without scucess, giving up





-- 
Mike Looijmans

