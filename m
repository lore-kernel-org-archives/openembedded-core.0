Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TlZkq-0004mX-7n
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 07:37:16 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBK6MTO8018861
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Dec 2012 22:22:29 -0800 (PST)
Received: from [128.224.162.205] (128.224.162.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Wed, 19 Dec 2012 22:22:28 -0800
Message-ID: <50D2AEE0.5000802@windriver.com>
Date: Thu, 20 Dec 2012 14:23:28 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Kang Kai <Kai.Kang@windriver.com>
References: <cover.1355902677.git.kai.kang@windriver.com>
	<1d85ab32f49b6d3eaab89eb78afe131415b00794.1355902677.git.kai.kang@windriver.com>
	<20121219110604.GB3525@jama.palm1.palmone.com>
	<50D26D8E.8000305@windriver.com>
In-Reply-To: <50D26D8E.8000305@windriver.com>
X-Originating-IP: [128.224.162.205]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	qBK6MTO8018861
Cc: openembedded-core@lists.openembedded.org,
	Martin Jansa <martin.jansa@gmail.com>, Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 4/4] oprofile: use dynamic root home directory
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
X-List-Received-Date: Thu, 20 Dec 2012 06:37:17 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B412=E6=9C=8820=E6=97=A5 09:44, Kang Kai wrote:
> On 2012=E5=B9=B412=E6=9C=8819=E6=97=A5 19:06, Martin Jansa wrote:
>> On Wed, Dec 19, 2012 at 05:39:39PM +0800, Kang Kai wrote:
>>> Use stub "ROOTHOME" to replace "/home/root" in oprofile-root.patch,=20
>>> then
>>> we can substitute it with configured root home directory.
>>>
>>> Signed-off-by: Kang Kai<kai.kang@windriver.com>
>>> ---
>>>   meta/recipes-kernel/oprofile/oprofile.inc          |    1 +
>>>   .../oprofile/oprofile/oprofile-root.patch          |   23=20
>>> ++++++++++++-------
>>>   2 files changed, 15 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/meta/recipes-kernel/oprofile/oprofile.inc=20
>>> b/meta/recipes-kernel/oprofile/oprofile.inc
>>> index b3ce852..0977065 100644
>>> --- a/meta/recipes-kernel/oprofile/oprofile.inc
>>> +++ b/meta/recipes-kernel/oprofile/oprofile.inc
>>> @@ -31,6 +31,7 @@ inherit autotools
>>>
>>>   EXTRA_OECONF =3D "--with-kernel-support --without-x"
>>>   do_configure () {
>>> +        find . -type f | xargs sed -i 's#ROOTHOME#${ROOT_HOME}#'
>>>       cp ${WORKDIR}/acinclude.m4 ${S}/
>>>       autotools_do_configure
>> You should use tab here.
>
> OK, thanks. I'll wait for others comments until this afternoon and=20
> then send V2.

Because no other comments and this is tiny update, I just update it in=20
the contribute branch on

http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dkangkai/roothome

which also show in cover letter.

Regards,
Kai


>
> Regards,
> Kai
>
>>
>> Cheers,
>>
>>>   }
>>> diff --git=20
>>> a/meta/recipes-kernel/oprofile/oprofile/oprofile-root.patch=20
>>> b/meta/recipes-kernel/oprofile/oprofile/oprofile-root.patch
>>> index db63a8e..f3fe4c9 100644
>>> --- a/meta/recipes-kernel/oprofile/oprofile/oprofile-root.patch
>>> +++ b/meta/recipes-kernel/oprofile/oprofile/oprofile-root.patch
>>> @@ -4,6 +4,11 @@ Upstream-Status: inappropriate [OE specific]
>>>
>>>   Signed-off-by: Mark Hatle<mark.hatle@windriver.com>
>>>
>>> +Replace "/home/root" with stub "ROOTHOME", then substitute it with
>>> +real root home directory which is configured dymanically.
>>> +
>>> +Signed-off-by: Kang Kai<kai.kang@windriver.com>
>>> +
>>>   diff -ur oprofile-0.9.7.orig/doc/opcontrol.1.in=20
>>> oprofile-0.9.7/doc/opcontrol.1.in
>>>   --- oprofile-0.9.7.orig/doc/opcontrol.1.in    2011-07-04=20
>>> 21:25:04.000000000 -0500
>>>   +++ oprofile-0.9.7/doc/opcontrol.1.in    2012-07-02=20
>>> 14:02:16.358865420 -0500
>>> @@ -12,7 +17,7 @@ diff -ur oprofile-0.9.7.orig/doc/opcontrol.1.in=20
>>> oprofile-0.9.7/doc/opcontrol.1.i
>>>    .SH FILES
>>>    .TP
>>>   -.I /root/.oprofile/daemonrc
>>> -+.I /home/root/.oprofile/daemonrc
>>> ++.I ROOTHOME/.oprofile/daemonrc
>>>    Configuration file for opcontrol
>>>    .TP
>>>    .I /var/lib/oprofile/samples/
>>> @@ -24,7 +29,7 @@ diff -ur oprofile-0.9.7.orig/doc/oprofile.1=20
>>> oprofile-0.9.7/doc/oprofile.1
>>>    Configuration files
>>>    .TP
>>>   -.I /root/.oprofile/daemonrc
>>> -+.I /home/root/.oprofile/daemonrc
>>> ++.I ROOTHOME/.oprofile/daemonrc
>>>    Configuration file for opcontrol
>>>    .TP
>>>    .I /opt/oprofile-0.9.7-rc3/share/oprofile/
>>> @@ -36,7 +41,7 @@ diff -ur oprofile-0.9.7.orig/doc/oprofile.1.in=20
>>> oprofile-0.9.7/doc/oprofile.1.in
>>>    Configuration files
>>>    .TP
>>>   -.I /root/.oprofile/daemonrc
>>> -+.I /home/root/.oprofile/daemonrc
>>> ++.I ROOTHOME/.oprofile/daemonrc
>>>    Configuration file for opcontrol
>>>    .TP
>>>    .I @prefix@/share/oprofile/
>>> @@ -48,7 +53,7 @@ diff -ur oprofile-0.9.7.orig/doc/oprofile.html=20
>>> oprofile-0.9.7/doc/oprofile.html
>>> <p>
>>>            Followed by list arguments for profiling set up. List of=20
>>> arguments
>>>   -            saved in<code=20
>>> class=3D"filename">/root/.oprofile/daemonrc</code>.
>>> -+            saved in<code=20
>>> class=3D"filename">/home/root/.oprofile/daemonrc</code>.
>>> ++            saved in<code=20
>>> class=3D"filename">ROOTHOME/.oprofile/daemonrc</code>.
>>>                Giving this option is not necessary; you can just=20
>>> directly pass one
>>>                of the setup options, e.g.<span=20
>>> class=3D"command"><strong>opcontrol --no-vmlinux</strong></span>.
>>> </p>
>>> @@ -57,7 +62,7 @@ diff -ur oprofile-0.9.7.orig/doc/oprofile.html=20
>>> oprofile-0.9.7/doc/oprofile.html
>>> <p>
>>>            Start data collection with either arguments provided=20
>>> by<code class=3D"option">--setup</code>
>>>   -        or information saved in<code=20
>>> class=3D"filename">/root/.oprofile/daemonrc</code>. Specifying
>>> -+        or information saved in<code=20
>>> class=3D"filename">/home/root/.oprofile/daemonrc</code>. Specifying
>>> ++        or information saved in<code=20
>>> class=3D"filename">ROOTHOME/.oprofile/daemonrc</code>. Specifying
>>>            the addition<code class=3D"option">--verbose</code>  makes=
=20
>>> the daemon generate lots of debug data
>>>            whilst it is running.
>>> </p>
>>> @@ -69,7 +74,7 @@ diff -ur oprofile-0.9.7.orig/doc/oprofile.xml=20
>>> oprofile-0.9.7/doc/oprofile.xml
>>> <listitem><para>
>>>            Followed by list arguments for profiling set up. List of=20
>>> arguments
>>>   -            saved in<filename>/root/.oprofile/daemonrc</filename>.
>>> -+            saved=20
>>> in<filename>/home/root/.oprofile/daemonrc</filename>.
>>> ++            saved in<filename>ROOTHOME/.oprofile/daemonrc</filename=
>.
>>>                Giving this option is not necessary; you can just=20
>>> directly pass one
>>>                of the setup options, e.g.<command>opcontrol=20
>>> --no-vmlinux</command>.
>>> </para></listitem>
>>> @@ -78,7 +83,7 @@ diff -ur oprofile-0.9.7.orig/doc/oprofile.xml=20
>>> oprofile-0.9.7/doc/oprofile.xml
>>> <listitem><para>
>>>            Start data collection with either arguments provided=20
>>> by<option>--setup</option>
>>>   -        or information saved=20
>>> in<filename>/root/.oprofile/daemonrc</filename>. Specifying
>>> -+        or information saved=20
>>> in<filename>/home/root/.oprofile/daemonrc</filename>. Specifying
>>> ++        or information saved=20
>>> in<filename>ROOTHOME/.oprofile/daemonrc</filename>. Specifying
>>>            the addition<option>--verbose</option>  makes the daemon=20
>>> generate lots of debug data
>>>            whilst it is running.
>>> </para></listitem>
>>> @@ -90,7 +95,7 @@ diff -ur=20
>>> oprofile-0.9.7.orig/gui/oprof_start_util.cpp oprofile-0.9.7/gui/oprof=
_s
>>>    string const get_config_dir()
>>>    {
>>>   -    return "/root";
>>> -+    return "/home/root";
>>> ++    return "ROOTHOME";
>>>    }
>>>
>>>    string daemon_pid;
>>> @@ -102,7 +107,7 @@ diff -ur oprofile-0.9.7.orig/utils/opcontrol=20
>>> oprofile-0.9.7/utils/opcontrol
>>>
>>>        # location for daemon setup information
>>>   -    SETUP_DIR=3D"/root/.oprofile"
>>> -+    SETUP_DIR=3D"/home/root/.oprofile"
>>> ++    SETUP_DIR=3D"ROOTHOME/.oprofile"
>>>        SETUP_FILE=3D"$SETUP_DIR/daemonrc"
>>>        SEC_SETUP_FILE=3D"$SETUP_DIR/daemonrc_new"
>>>
>>> --=20
>>> 1.7.5.4
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



