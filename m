Return-Path: <Muhammad_Shakeel@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 4E662619DD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 11:41:43 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Uyh9z-00027V-Dj from Muhammad_Shakeel@mentor.com ;
	Mon, 15 Jul 2013 04:41:43 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 15 Jul 2013 04:41:43 -0700
Received: from [137.202.157.119] (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.2.247.3; Mon, 15 Jul 2013 12:41:40 +0100
Message-ID: <51E3E01D.9050905@mentor.com>
Date: Mon, 15 Jul 2013 16:42:21 +0500
From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1373528728-27268-1-git-send-email-muhammad_shakeel@mentor.com>
	<51DEF360.8030509@linux.intel.com>
	<53609789-437E-429A-997E-7A1BECF21A48@mentor.com>
	<51DEFA34.70405@linux.intel.com>
	<CAJTo0LYmH8sDrpfYOhSd8WXKeoKGd-JiVu1EHMuj5vRLYBcxtQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYmH8sDrpfYOhSd8WXKeoKGd-JiVu1EHMuj5vRLYBcxtQ@mail.gmail.com>
X-Originating-IP: [137.202.0.76]
X-OriginalArrivalTime: 15 Jul 2013 11:41:43.0038 (UTC)
	FILETIME=[471701E0:01CE8150]
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [v2] openssh: Enabling with systemd
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
X-List-Received-Date: Mon, 15 Jul 2013 11:41:43 -0000
Content-Type: multipart/alternative;
	boundary="------------010708000201040200040905"

--------------010708000201040200040905
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/12/2013 09:32 PM, Burton, Ross wrote:
> On 11 July 2013 19:32, Saul  Wold <sgw@linux.intel.com> wrote:
 >>> We are seeing different checks for different recipes. Do you
 >>> guys think that it is possible to handle them in bbclass.
 >>>
 >> How different are they, there is the DISTRO_FEATURE check and then
 >> typically the service file or the init file is sed'ed and
 >> installed.
 >
 > My initial thoughts were to keep it simple and have a
 > do_install_append() that deleted the sysvinit or systemd files
 > depending on DISTRO_FEATURES, leaving installing the files themselves
 > (from upstream, from a file, whatever) up to the recipe because
 > that's where the complications are.

We can also easily move 'sed' part to systemd class because we will only be
looking for all the service files in ${systemd_unitdir}, irrespective of
how these got installed.

I gave a little thought to move the installation part into the class and 
there
can be a solution but probably little complicated. The neatest solution 
would
be to define an another variable say 'SYSTEMD_SERVICE_FILES_{PN}'
which will hold the name of all the service files, need to be installed, 
along
with their relative path from WORKDIR. We can check in systemd class 
that if
${systemd_unitdir} is not present, means upstream hasn't installed 
anything,
then install whatever is in 'SYSTEMD_SERVICE_FILES_{PN}'.

Other option is to reuse current 'SYSTEMD_SERVICE_${PN}' that lists the 
service
files in the package but doesn't include the path of service files. If 
we do not
want a new variable, which seems like a duplication, then we can add the 
path
with the service files in this variable and tweak systemd class to 
handle this in
current implementation. We will add the path only if service file to be 
installed is
not present in WORKDIR but buried somewhere in the package source.

Please let me know of your thoughts about installation part.

Best Regards,
Shakeel


--------------010708000201040200040905
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    On 07/12/2013 09:32 PM, Burton, Ross wrote:<br>
    <span style="white-space: pre;">&gt; On 11 July 2013 19:32, Saul
      Wold <a class="moz-txt-link-rfc2396E" href="mailto:sgw@linux.intel.com">&lt;sgw@linux.intel.com&gt;</a> wrote:<br>
      &gt;&gt;&gt; We are seeing different checks for different recipes.
      Do you<br>
      &gt;&gt;&gt; guys think that it is possible to handle them in
      bbclass.<br>
      &gt;&gt;&gt; <br>
      &gt;&gt; How different are they, there is the DISTRO_FEATURE check
      and then <br>
      &gt;&gt; typically the service file or the init file is sed'ed and
      <br>
      &gt;&gt; installed.<br>
      &gt; <br>
      &gt; My initial thoughts were to keep it simple and have a <br>
      &gt; do_install_append() that deleted the sysvinit or systemd
      files <br>
      &gt; depending on DISTRO_FEATURES, leaving installing the files
      themselves<br>
      &gt; (from upstream, from a file, whatever) up to the recipe
      because<br>
      &gt; that's where the complications are.</span><br>
    <br>
    We can also easily move 'sed' part to systemd class because we will
    only be <br>
    looking for all the service files in ${systemd_unitdir},
    irrespective of <br>
    how these got installed.<br>
    <br>
    I gave a little thought to move the installation part into the class
    and there <br>
    can be a solution but probably little complicated. The neatest
    solution would <br>
    be to define an another variable say 'SYSTEMD_SERVICE_FILES_{PN}' <br>
    which will hold the name of all the service files, need to be
    installed, along <br>
    with their relative path from WORKDIR. We can check in systemd class
    that if <br>
    ${systemd_unitdir} is not present, means upstream hasn't installed
    anything, <br>
    then install whatever is in 'SYSTEMD_SERVICE_FILES_{PN}'.<br>
    <br>
    Other option is to reuse current 'SYSTEMD_SERVICE_${PN}' that lists
    the service <br>
    files in the package but doesn't include the path of service files.
    If we do not <br>
    want a new variable, which seems like a duplication, then we can add
    the path <br>
    with the service files in this variable and tweak systemd class to
    handle this in <br>
    current implementation. We will add the path only if service file to
    be installed is <br>
    not present in WORKDIR but buried somewhere in the package source.<br>
    <br>
    Please let me know of your thoughts about installation part.<br>
    <br>
    Best Regards,<br>
    Shakeel<br>
    <br>
  </body>
</html>

--------------010708000201040200040905--
