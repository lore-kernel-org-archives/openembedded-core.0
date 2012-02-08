Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1RvCZM-00062k-Ch
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 19:48:40 +0100
Received: by qcso7 with SMTP id o7so479735qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Feb 2012 10:40:36 -0800 (PST)
Received: by 10.224.33.66 with SMTP id g2mr28099716qad.71.1328726436103;
	Wed, 08 Feb 2012 10:40:36 -0800 (PST)
Received: from [128.224.170.202] ([89.121.200.106])
	by mx.google.com with ESMTPS id c2sm239586qao.15.2012.02.08.10.40.33
	(version=SSLv3 cipher=OTHER); Wed, 08 Feb 2012 10:40:34 -0800 (PST)
Message-ID: <4F32C1A6.70402@gherzan.ro>
Date: Wed, 08 Feb 2012 20:40:38 +0200
From: Andrei Gherzan <andrei@gherzan.ro>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:9.0) Gecko/20111229 Thunderbird/9.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1328717200-13689-1-git-send-email-andrei@gherzan.ro>
	<1328717410.14363.46.camel@phil-desktop>
	<CAP9ODKqUo7qazvdbWxQB_bQh3jpf+Uf=kf1YVp=Y-oB6QQYGGQ@mail.gmail.com>
	<1328720440.14363.56.camel@phil-desktop>
In-Reply-To: <1328720440.14363.56.camel@phil-desktop>
Subject: Re: [PATCH] dhcp: Update to 4.2.3-P2
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
X-List-Received-Date: Wed, 08 Feb 2012 18:48:40 -0000
Content-Type: multipart/alternative;
	boundary="------------020000080707070602020207"

--------------020000080707070602020207
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/08/2012 07:00 PM, Phil Blundell wrote:
> On Wed, 2012-02-08 at 14:30 -0200, Otavio Salvador wrote:
>> On Wed, Feb 8, 2012 at 14:10, Phil Blundell<philb@gnu.org>  wrote:
>>          This isn't just a straightforward update, you seem to be
>>          moving dhclient
>>          from ${base_sbindir} to ${sbindir}.  If that's a good thing
>>          (which
>>          doesn't seem totally obvious to me) then it ought at least to
>>          be
>>          mentioned in the commit message.
>>
>>
>> He is doing that because it links against libcrypt that is at
>> ${libdir}. But it clearly needs to be in another commit or, at least,
>> explicit in the changlog.
> Yeah, I guessed it was probably something like that.  But this seems
> like a bad solution since anybody who has /usr separate probably does
> want dhclient during bootup.  In particular, if you have /usr on NFS
> then you might be hosed if dhclient is in /usr/bin.
>
> It seems like the right way to fix this is one of:
>
> a) move libcrypto to ${base_libdir}, or
> b) stop dhclient from linking against libcrypto, or
> c) make it link against the static rather than shared library
>
> Do we know why dhclient has grown this dependency on libcrypto in the
> first place?  Or, as an alternative data point, is there a particular
> reason why this upgrade is required (i.e. could we just stick with the
> old version)?
>
There is no "grown dependency on libcrypto" in this version. It used to 
be in last version we had as well but as this is a warning, i guess it 
was ignored as other QA warning are present in a core-image-minimal 
build for example.
Here is the log from a build where it used to be dhcp 4.2.0 (last 
version in yocto):

    dhcp-4.2.0: dhcp: {build
    path}/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/dhcp-4.2.0-r5/packages-split/dhcp-client/sbin/dhclient
    links to something under exec_prefix
    dhcp-4.2.0: ldd reports: <----->libcrypto.so.1.0.0 => {build
    path}/tmp/sysroots/vexpressa9/usr/lib/libcrypto.so.1.0.0 (0xdead1000)


So this is not a new thing. In 4.2.3 this library check and linkage is 
removed - from 4.2.1 rel notes:

    - ./configure on longer searches for -lcrypto to explicitly link against.
       This fixes a bug where 'dhclient' would have shared library dependencies
       on '/usr/lib'.  [ISC-Bugs #21967]


While integrating the new version of dhcp, the compile stage used to fail:

    |
    /home/agherzan/work/wrs/yocto-adige/2012-02-08-12-18-imx53/tmp-eglibc-eglibc/sysroots/imx53qsb/usr/lib//libdns.a(openssldh_link.o):
    In function `openssldh_fromdns':
    |
    /home/agherzan/work/wrs/yocto-adige/2012-02-08-12-18-imx53/tmp-eglibc-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/bind-9.8.1-r2/bind-9.8.1/lib/export/dns/../../../lib/dns/openssldh_link.c:344:
    undefined reference to `DH_new'
    |
    /home/agherzan/work/wrs/yocto-adige/2012-02-08-12-18-imx53/tmp-eglibc-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/bind-9.8.1-r2/bind-9.8.1/lib/export/dns/../../../lib/dns/openssldh_link.c:387:
    undefined reference to `BN_bin2bn'
    |
    /home/agherzan/work/wrs/yocto-adige/2012-02-08-12-18-imx53/tmp-eglibc-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/bind-9.8.1-r2/bind-9.8.1/lib/export/dns/../../../lib/dns/openssldh_link.c:435:
    undefined reference to `DH_free'
    |
    /home/agherzan/work/wrs/yocto-adige/2012-02-08-12-18-imx53/tmp-eglibc-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/bind-9.8.1-r2/bind-9.8.1/lib/export/dns/../../../lib/dns/openssldh_link.c:425:
    undefined reference to `BN_bin2bn'
    |
    /home/agherzan/work/wrs/yocto-adige/2012-02-08-12-18-imx53/tmp-eglibc-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/bind-9.8.1-r2/bind-9.8.1/lib/export/dns/../../../lib/dns/openssldh_link.c:430:
    undefined reference to `DH_free'
    |
    /home/agherzan/work/wrs/yocto-adige/2012-02-08-12-18-imx53/tmp-eglibc-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/bind-9.8.1-r2/bind-9.8.1/lib/export/dns/../../../lib/dns/openssldh_link.c:409:
    undefined reference to `BN_bin2bn'
    |
    /home/agherzan/work/wrs/yocto-adige/2012-02-08-12-18-imx53/tmp-eglibc-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/bind-9.8.1-r2/bind-9.8.1/lib/export/dns/../../../lib/dns/openssldh_link.c:410:
    undefined reference to `BN_cmp'
    |
    /home/agherzan/work/wrs/yocto-adige/2012-02-08-12-18-imx53/tmp-eglibc-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/bind-9.8.1-r2/bind-9.8.1/lib/export/dns/../../../lib/dns/openssldh_link.c:411:
    undefined reference to `BN_free'
    |
    /home/agherzan/work/wrs/yocto-adige/2012-02-08-12-18-imx53/tmp-eglibc-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/bind-9.8.1-r2/bind-9.8.1/lib/export/dns/../../../lib/dns/openssldh_link.c:438:
    undefined reference to `BN_bin2bn'
    |
    /home/agherzan/work/wrs/yocto-adige/2012-02-08-12-18-imx53/tmp-eglibc-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/bind-9.8.1-r2/bind-9.8.1/lib/export/dns/../../../lib/dns/openssldh_link.c:441:
    undefined reference to `BN_num_bits'


so i had to add this -lcrypto check back in configure.

At that point i didn't realize that this change could create problems 
with lcrypto.

omapip needs libdns.a and libisc.a from bind, which needs lcypto. Client 
needs omapip. So this is the way things are linked around. This is why 
in the end omapip needs lcrypto.
For example libdna.a contains openssl_link.o - openssl_link.c. In 
dst__openssl_init function we have references to:
CRYPTO_num_locks
OPENSSL_config

All these from lcrypto.


To sum it up:
1. lcrypto / dhclient is not a new problem
2. -lcryto was present in LIBS in the last yocto version of dhcp
3. Your "commit message" observations are correct. I will be a little 
more careful about this.
4. My opinion on this would be to

@g

--------------020000080707070602020207
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    On 02/08/2012 07:00 PM, Phil Blundell wrote:
    <blockquote cite="mid:1328720440.14363.56.camel@phil-desktop"
      type="cite">
      <pre wrap="">On Wed, 2012-02-08 at 14:30 -0200, Otavio Salvador wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">On Wed, Feb 8, 2012 at 14:10, Phil Blundell <a class="moz-txt-link-rfc2396E" href="mailto:philb@gnu.org">&lt;philb@gnu.org&gt;</a> wrote:
        This isn't just a straightforward update, you seem to be
        moving dhclient
        from ${base_sbindir} to ${sbindir}.  If that's a good thing
        (which
        doesn't seem totally obvious to me) then it ought at least to
        be
        mentioned in the commit message.
        

He is doing that because it links against libcrypt that is at
${libdir}. But it clearly needs to be in another commit or, at least,
explicit in the changlog.
</pre>
      </blockquote>
      <pre wrap="">
Yeah, I guessed it was probably something like that.  But this seems
like a bad solution since anybody who has /usr separate probably does
want dhclient during bootup.  In particular, if you have /usr on NFS
then you might be hosed if dhclient is in /usr/bin.

It seems like the right way to fix this is one of:

a) move libcrypto to ${base_libdir}, or
b) stop dhclient from linking against libcrypto, or
c) make it link against the static rather than shared library

Do we know why dhclient has grown this dependency on libcrypto in the
first place?  Or, as an alternative data point, is there a particular
reason why this upgrade is required (i.e. could we just stick with the
old version)?

</pre>
    </blockquote>
    There is no "grown dependency on libcrypto" in this version. It used
    to be in last version we had as well but as this is a warning, i
    guess it was ignored as other QA warning are present in a
    core-image-minimal build for example.<br>
    Here is the log from a build where it used to be dhcp 4.2.0 (last
    version in yocto):<br>
    <blockquote>dhcp-4.2.0: dhcp: {build
      path}/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/dhcp-4.2.0-r5/packages-split/dhcp-client/sbin/dhclient
      links to something under exec_prefix<br>
      dhcp-4.2.0: ldd reports: &lt;-----&gt;libcrypto.so.1.0.0 =&gt;
      {build path}/tmp/sysroots/vexpressa9/usr/lib/libcrypto.so.1.0.0
      (0xdead1000)<br>
    </blockquote>
    <br>
    So this is not a new thing. In 4.2.3 this library check and linkage
    is removed - from 4.2.1 rel notes:<br>
    <br>
    <meta http-equiv="content-type" content="text/html;
      charset=ISO-8859-1">
    <blockquote>
      <pre style="color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; word-wrap: break-word; white-space: pre-wrap; ">- ./configure on longer searches for -lcrypto to explicitly link against.
  This fixes a bug where 'dhclient' would have shared library dependencies
  on '/usr/lib'.  [ISC-Bugs #21967]</pre>
    </blockquote>
    <br>
    While integrating the new version of dhcp, the compile stage used to
    fail:<br>
    <br>
    <blockquote>|
      /home/agherzan/work/wrs/yocto-adige/2012-02-08-12-18-imx53/tmp-eglibc-eglibc/sysroots/imx53qsb/usr/lib//libdns.a(openssldh_link.o):
      In function `openssldh_fromdns':<br>
      |
      /home/agherzan/work/wrs/yocto-adige/2012-02-08-12-18-imx53/tmp-eglibc-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/bind-9.8.1-r2/bind-9.8.1/lib/export/dns/../../../lib/dns/openssldh_link.c:344:
      undefined reference to `DH_new'<br>
      |
      /home/agherzan/work/wrs/yocto-adige/2012-02-08-12-18-imx53/tmp-eglibc-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/bind-9.8.1-r2/bind-9.8.1/lib/export/dns/../../../lib/dns/openssldh_link.c:387:
      undefined reference to `BN_bin2bn'<br>
      |
      /home/agherzan/work/wrs/yocto-adige/2012-02-08-12-18-imx53/tmp-eglibc-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/bind-9.8.1-r2/bind-9.8.1/lib/export/dns/../../../lib/dns/openssldh_link.c:435:
      undefined reference to `DH_free'<br>
      |
      /home/agherzan/work/wrs/yocto-adige/2012-02-08-12-18-imx53/tmp-eglibc-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/bind-9.8.1-r2/bind-9.8.1/lib/export/dns/../../../lib/dns/openssldh_link.c:425:
      undefined reference to `BN_bin2bn'<br>
      |
      /home/agherzan/work/wrs/yocto-adige/2012-02-08-12-18-imx53/tmp-eglibc-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/bind-9.8.1-r2/bind-9.8.1/lib/export/dns/../../../lib/dns/openssldh_link.c:430:
      undefined reference to `DH_free'<br>
      |
      /home/agherzan/work/wrs/yocto-adige/2012-02-08-12-18-imx53/tmp-eglibc-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/bind-9.8.1-r2/bind-9.8.1/lib/export/dns/../../../lib/dns/openssldh_link.c:409:
      undefined reference to `BN_bin2bn'<br>
      |
      /home/agherzan/work/wrs/yocto-adige/2012-02-08-12-18-imx53/tmp-eglibc-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/bind-9.8.1-r2/bind-9.8.1/lib/export/dns/../../../lib/dns/openssldh_link.c:410:
      undefined reference to `BN_cmp'<br>
      |
      /home/agherzan/work/wrs/yocto-adige/2012-02-08-12-18-imx53/tmp-eglibc-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/bind-9.8.1-r2/bind-9.8.1/lib/export/dns/../../../lib/dns/openssldh_link.c:411:
      undefined reference to `BN_free'<br>
      |
      /home/agherzan/work/wrs/yocto-adige/2012-02-08-12-18-imx53/tmp-eglibc-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/bind-9.8.1-r2/bind-9.8.1/lib/export/dns/../../../lib/dns/openssldh_link.c:438:
      undefined reference to `BN_bin2bn'<br>
      |
      /home/agherzan/work/wrs/yocto-adige/2012-02-08-12-18-imx53/tmp-eglibc-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/bind-9.8.1-r2/bind-9.8.1/lib/export/dns/../../../lib/dns/openssldh_link.c:441:
      undefined reference to `BN_num_bits'<br>
    </blockquote>
    <br>
    so i had to add this -lcrypto check back in configure.<br>
    <br>
    At that point i didn't realize that this change could create
    problems with lcrypto. <br>
    <br>
    omapip needs libdns.a and libisc.a from bind, which needs lcypto.
    Client needs omapip. So this is the way things are linked around.
    This is why in the end omapip needs lcrypto.<br>
    For example libdna.a contains openssl_link.o - openssl_link.c. In
    dst__openssl_init function we have references to:<br>
    CRYPTO_num_locks<br>
    OPENSSL_config<br>
    <br>
    All these from lcrypto.<br>
    <br>
    <br>
    To sum it up:<br>
    1. lcrypto / dhclient is not a new problem<br>
    2. -lcryto was present in LIBS in the last yocto version of dhcp<br>
    3. Your "commit message" observations are correct. I will be a
    little more careful about this.<br>
    4. My opinion on this would be to <br>
    <br>
    @g<br>
  </body>
</html>

--------------020000080707070602020207--
