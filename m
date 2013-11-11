Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AD1AD6D7BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 02:52:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rAB2qFpp020309
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 10 Nov 2013 18:52:15 -0800 (PST)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Sun, 10 Nov 2013 18:52:15 -0800
Message-ID: <52804662.1090605@windriver.com>
Date: Mon, 11 Nov 2013 10:52:18 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <cover.1383974819.git.Qi.Chen@windriver.com>
	<74d67107ced2e10a00bc2ff9b84d42a7376fabae.1383974819.git.Qi.Chen@windriver.com>
	<1384038034.3798.46.camel@x121e.pbcl.net>
In-Reply-To: <1384038034.3798.46.camel@x121e.pbcl.net>
X-Originating-IP: [128.224.162.213]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/8] initscripts: add setup-commands.sh
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
X-List-Received-Date: Mon, 11 Nov 2013 02:52:14 -0000
Content-Type: multipart/alternative;
	boundary="------------030007030909050808080900"

--------------030007030909050808080900
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/2013 07:00 AM, Phil Blundell wrote:
> On Sat, 2013-11-09 at 13:28 +0800, Qi.Chen@windriver.com wrote:
>> +for dir in /usr/bin /usr/sbin; do
>> +    if [ ! -e $dir ]; then
>> +	if [ "$VERBOSE" != "no" ]; then
>> +	    echo "WARN: $dir missing, setting up links to busybox"
>> +	fi
>> +	mkdir -p $dir
>> +	for suffix in ".nosuid" ".suid" ""; do
>> +	    if [ ! -e /etc/busybox.links${suffix} ]; then
>> +		continue
>> +	    fi
>> +	    usr_commands=`grep "$dir" /etc/busybox.links${suffix}`
>> +	    for command in $usr_commands; do
>> +		ln -sf /bin/busybox${suffix} $command
>> +	    done

Hi Phil,

This script is an effort to try to make system boot up even if /usr is 
not there.
It relies on busybox because in most cases, busybox is there in an OE 
based system.
And please see comments below.

> This seems slightly bogus for a number of reasons:
>
> 1. initscript doesn't obviously rdepend on busybox so it's not obvious
> that the latter will always be available;

Yes. Initscript doesn't rdepend on busybox. But note it also doesn't 
rdepend on sed or awk or grep.
So I think it's reasonable to assume the presence of busybox.

> 2. it should probably be using ${base_bindir} and ${bindir} rather than
> hardcoding absolute paths.

In init scripts, we usually "hardcode" things, because these scripts are 
destined to run on target.
In recipes we try not to hardcode things because the recipe may need to 
extend to "native" or "nativesdk".

> 3. the whole idea of creating a shadow "/usr/bin" underneath what's
> meant to be a mountpoint seems rather dubious to me.

Agree.

The problem here is that the init scripts under /etc/rcS.d/ need to 
execute commands like awk, dirname, and readlink which are from /usr.

As it's not appropriate to move these commands into /bin, basically 
there are only two options I can see here. One is to modify these 
scripts to use only commands from /bin or /sbin; the other is to make 
use of busybox, as busybox is located under /bin as it provides these 
commands.
I chose to the latter one because I thought that solution would have the 
less impact.

What do you think? Do we need to modify the init scripts? Or any other 
solution?


> 4. this seems like distro policy and not something that really belongs
> in oe-core at all.  For systems where ${bindir} and ${base_bindir} are
> on the same filesystem (or even are the same directory) this script will
> just make bootup slower without achieving anything useful.
>
> p.
>

If /usr and / are on the same file system, this script has no real 
effect because /usr will always be there. So I think it will not take 
much time at boot.

If ${base_bindir} and ${bindir} are the same, that means that there's no 
/usr. In this case, there should no /usr/xxx entries in 
/etc/busybox.links, so this script should also function correctly and it 
will not take much time at boot.

(I just configured ${bindir} and ${base_bindir} to be the same and 
performed a build, it failed. I'm not sure whether it's valid to make 
such configurations in OE.)

Best Regards,
Chen Qi

>
>


--------------030007030909050808080900
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 11/10/2013 07:00 AM, Phil Blundell
      wrote:<br>
    </div>
    <blockquote cite="mid:1384038034.3798.46.camel@x121e.pbcl.net"
      type="cite">
      <pre wrap="">On Sat, 2013-11-09 at 13:28 +0800, <a class="moz-txt-link-abbreviated" href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">+for dir in /usr/bin /usr/sbin; do
+    if [ ! -e $dir ]; then
+	if [ "$VERBOSE" != "no" ]; then
+	    echo "WARN: $dir missing, setting up links to busybox"
+	fi
+	mkdir -p $dir
+	for suffix in ".nosuid" ".suid" ""; do
+	    if [ ! -e /etc/busybox.links${suffix} ]; then
+		continue
+	    fi
+	    usr_commands=`grep "$dir" /etc/busybox.links${suffix}`
+	    for command in $usr_commands; do
+		ln -sf /bin/busybox${suffix} $command
+	    done
</pre>
      </blockquote>
    </blockquote>
    <br>
    Hi Phil,<br>
    <br>
    This script is an effort to try to make system boot up even if /usr
    is not there.<br>
    It relies on busybox because in most cases, busybox is there in an
    OE based system.<br>
    And please see comments below.<br>
    <br>
    <blockquote cite="mid:1384038034.3798.46.camel@x121e.pbcl.net"
      type="cite">
      <pre wrap="">
This seems slightly bogus for a number of reasons:

1. initscript doesn't obviously rdepend on busybox so it's not obvious
that the latter will always be available;
</pre>
    </blockquote>
    <br>
    Yes. Initscript doesn't rdepend on busybox. But note it also doesn't
    rdepend on sed or awk or grep.<br>
    So I think it's reasonable to assume the presence of busybox.<br>
    <br>
    <blockquote cite="mid:1384038034.3798.46.camel@x121e.pbcl.net"
      type="cite">
      <pre wrap="">
2. it should probably be using ${base_bindir} and ${bindir} rather than
hardcoding absolute paths.
</pre>
    </blockquote>
    <br>
    In init scripts, we usually "hardcode" things, because these scripts
    are destined to run on target.<br>
    In recipes we try not to hardcode things because the recipe may need
    to extend to "native" or "nativesdk".<br>
    <br>
    <blockquote cite="mid:1384038034.3798.46.camel@x121e.pbcl.net"
      type="cite">
      <pre wrap="">
3. the whole idea of creating a shadow "/usr/bin" underneath what's
meant to be a mountpoint seems rather dubious to me. 
</pre>
    </blockquote>
    <br>
    Agree.<br>
    <br>
    The problem here is that the init scripts under <i
      class="moz-txt-slash"><span class="moz-txt-tag">/</span>etc/rcS.d<span
        class="moz-txt-tag">/</span></i> need to execute commands like
    awk, dirname, and readlink which are from /usr.
    <br>
    <br>
    As it's not appropriate to move these commands into /bin, basically
    there are only two options I can see here. One is to modify these
    scripts to use only commands from /bin or /sbin; the other is to
    make use of busybox, as busybox is located under /bin as it provides
    these commands.
    <br>
    I chose to the latter one because I thought that solution would have
    the less impact.
    <br>
    <br>
    What do you think? Do we need to modify the init scripts? Or any
    other solution?
    <br>
    <br>
    <br>
    <blockquote cite="mid:1384038034.3798.46.camel@x121e.pbcl.net"
      type="cite">
      <pre wrap="">
4. this seems like distro policy and not something that really belongs
in oe-core at all.  For systems where ${bindir} and ${base_bindir} are
on the same filesystem (or even are the same directory) this script will
just make bootup slower without achieving anything useful.

p.

</pre>
    </blockquote>
    <br>
    If /usr and / are on the same file system, this script has no real
    effect because /usr will always be there. So I think it will not
    take much time at boot.<br>
    <br>
    If ${base_bindir} and ${bindir} are the same, that means that
    there's no /usr. In this case, there should no /usr/xxx entries in
    /etc/busybox.links, so this script should also function correctly
    and it will not take much time at boot.<br>
    <br>
    (I just configured ${bindir} and ${base_bindir} to be the same and
    performed a build, it failed. I'm not sure whether it's valid to
    make such configurations in OE.)<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <br>
    <blockquote cite="mid:1384038034.3798.46.camel@x121e.pbcl.net"
      type="cite">
      <pre wrap="">


</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------030007030909050808080900--
