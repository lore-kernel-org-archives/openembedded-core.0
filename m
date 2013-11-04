Return-Path: <angstrom-dev@emagii.com>
Received: from smtprelay-h21.telenor.se (smtprelay-h21.telenor.se
	[195.54.99.196])
	by mail.openembedded.org (Postfix) with ESMTP id B5FB16CEF1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 08:09:47 +0000 (UTC)
Received: from ipb4.telenor.se (ipb4.telenor.se [195.54.127.167])
	by smtprelay-h21.telenor.se (Postfix) with ESMTP id 6E0FBE814A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 09:09:14 +0100 (CET)
X-SENDER-IP: [83.227.57.102]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AuMVAPZUd1JT4zlmPGdsb2JhbAANTIM/iTi2VoE3AwEBAQE4gloBAQEBAgEnURELGAkWDwkDAgECATEUBg0IAQGHdwsIqnCTAY9fhC4DmAqTQ4Ft
X-IronPort-AV: E=Sophos;i="4.93,630,1378850400"; 
	d="scan'208,217";a="348111633"
Received: from c-6639e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.199]) ([83.227.57.102])
	by ipb4.telenor.se with ESMTP; 04 Nov 2013 09:09:13 +0100
Message-ID: <52775629.8080203@emagii.com>
Date: Mon, 04 Nov 2013 09:09:13 +0100
From: Ulf Samuelsson <angstrom-dev@emagii.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <5276E3E3.7080807@emagii.com>
In-Reply-To: <5276E3E3.7080807@emagii.com>
Subject: Re: [Angstrom-devel] Mix of systemd version in Angstrom Master
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
X-List-Received-Date: Mon, 04 Nov 2013 08:09:48 -0000
Content-Type: multipart/alternative;
	boundary="------------070104010402000902040107"

--------------070104010402000902040107
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 2013-11-04 01:01, Ulf Samuelsson wrote:
> Have built the Angstrom master for a Beaglebone.
>
> Trying to create a simple systemd service (non-forking).
> This fails to start.
>
> When I look into the systemd log (log_level=debug),
> there are references to "/org/freedesktop/systemd1"
> which does not exist.
>
>
>         Over the Rainbow <http://www.bbc.co.uk/programmes/b03bvnf9>
>
>
> Instead  "/run/systemd" exist, which I believe
> is present in newer systemd's.
>
> The service uses the boost, curl, curlpp and thread libraries.
> Uses UDP and serial port for communication.
>
> I do not use D-Bus directly, but it seems to be related to D-Bus anyway.
>
> Anyone got a clue on how to proceed?
Had another look, and I was barking up the wrong tree.
/usr/share/dbus-1/services contains org.freedesktop.systemd1.service

My app dies when I do

      getenv("HOME");

When I define
User=root
Group=root

the nodeserver.service it starts without problem.

Sorry to bother.

BR
Ulf

>
> BR
> Ulf Samuelsson
>
> root@beaglebone:/lib/systemd/system# dmesg
> [  565.616506] systemd[1]: Accepted connection on private bus.
> [  565.625796] systemd[1]: Got D-Bus request: 
> org.freedesktop.systemd1.Manager.StartUnit() on /org/freedesktop/systemd1
> [  565.627071] systemd[1]: Trying to enqueue job 
> nodeserver-dbg.service/start/replace
> [  565.627719] systemd[1]: Installed new job 
> nodeserver-dbg.service/start as 1239
> [  565.627784] systemd[1]: Enqueued job nodeserver-dbg.service/start 
> as 1239
> [  565.628048] systemd[1]: Starting ICU Nodeserver...
> [  565.628539] systemd[1]: About to execute /usr/bin/nodeserver
> [  565.632042] systemd[1]: Forked /usr/bin/nodeserver as 700
> [  565.637804] systemd[1]: nodeserver-dbg.service changed dead -> running
> [  565.637895] systemd[1]: Job nodeserver-dbg.service/start finished, 
> result=done
> [  565.637991] systemd[1]: Started ICU Nodeserver.
> [  565.643147] systemd[1]: Got D-Bus request: 
> org.freedesktop.systemd1.Manager.GetUnit() on /org/freedesktop/systemd1
> [  565.645611] systemd[1]: Got D-Bus request: 
> org.freedesktop.DBus.Properties.Get() on 
> /org/freedesktop/systemd1/unit/nodeserver_2ddbg_2ese
> [  565.646393] systemd[1]: Got D-Bus request: 
> org.freedesktop.DBus.Local.Disconnected() on /org/freedesktop/DBus/Local
> [  565.695586] systemd[1]: Received SIGCHLD from PID 700 (nodeserver).
> [  565.695940] systemd[1]: Got SIGCHLD for process 700 (nodeserver)
> [  565.696349] systemd[1]: Child 700 died (code=killed, status=11/SEGV)
> [  565.696377] systemd[1]: Child 700 belongs to nodeserver-dbg.service
> [  565.696436] systemd[1]: nodeserver-dbg.service: main process 
> exited, code=killed, status=11/SEGV
> [  565.697576] systemd[1]: nodeserver-dbg.service changed running -> 
> failed
> [  565.698397] systemd[1]: Unit nodeserver-dbg.service entered failed 
> state
> [  565.708643] systemd[1]: Accepted connection on private bus.
> [  565.712325] systemd[1]: Got D-Bus request: 
> org.freedesktop.systemd1.Agent.Released() on 
> /org/freedesktop/systemd1/agent
> [  565.712736] systemd[1]: nodeserver-dbg.service: cgroup is empty
> [  565.713126] systemd[1]: Got D-Bus request: 
> org.freedesktop.DBus.Local.Disconnected() on /org/freedesktop/DBus/Local
> [  573.192670] systemd[1]: Accepted connection on private bus.
> [  573.197976] systemd[1]: Got D-Bus request: 
> org.freedesktop.DBus.Properties.GetAll() on 
> /org/freedesktop/systemd1/unit/nodeserver_2ddbg_e
> [  573.199318] systemd[1]: Looking for unit files in:
> [  573.199345] systemd[1]:      /etc/systemd/system
> [  573.199360] systemd[1]:      /lib/systemd/system
> [  573.199898] systemd[1]: Looking for SysV init scripts in:
> [  573.199919] systemd[1]:      /etc/init.d
> [  573.199939] systemd[1]: Looking for SysV rcN.d links in:
> [  573.199954] systemd[1]:      /etc
> [  573.213709] systemd[1]: Got D-Bus request: 
> org.freedesktop.DBus.Local.Disconnected() on /org/freedesktop/DBus/Local
> [  600.000471] systemd[1]: Timer elapsed on cpu-ondemand.timer
> [  600.000520] systemd[1]: Trying to enqueue job 
> cpu-ondemand.service/start/replace
> [  600.001038] systemd[1]: Installed new job 
> cpu-ondemand.service/start as 1287
> [  600.001121] systemd[1]: Enqueued job cpu-ondemand.service/start as 
> 1287
> [  600.001200] systemd[1]: cpu-ondemand.timer changed waiting -> running
> [  600.001335] systemd[1]: Starting Switch to ondemand CPU-freq 
> governor...
> [  600.001729] systemd[1]: About to execute /usr/bin/cpufreq-set -g 
> ondemand
> [  600.003352] systemd[1]: Forked /usr/bin/cpufreq-set as 704
> [  600.006998] systemd[1]: cpu-ondemand.service changed dead -> start
> [  600.007118] systemd[1]: Running GC...
> [  600.026202] systemd[1]: Received SIGCHLD from PID 704 (cpufreq-set).
> [  600.026412] systemd[1]: Got SIGCHLD for process 704 (cpufreq-set)
> [  600.026794] systemd[1]: Child 704 died (code=exited, status=0/SUCCESS)
> [  600.026848] systemd[1]: Child 704 belongs to cpu-ondemand.service
> [  600.026907] systemd[1]: cpu-ondemand.service: main process exited, 
> code=exited, status=0/SUCCESS
> [  600.028323] systemd[1]: cpu-ondemand.service changed start -> dead
> [  600.028373] systemd[1]: cpu-ondemand.timer got notified about unit 
> deactivation.
> [  600.028413] systemd[1]: cpu-ondemand.timer: Timer is elapsed.
> [  600.028434] systemd[1]: cpu-ondemand.timer changed running -> elapsed
> [  600.029147] systemd[1]: Job cpu-ondemand.service/start finished, 
> result=done
> [  600.029246] systemd[1]: Started Switch to ondemand CPU-freq governor.
> [  600.040413] systemd[1]: Accepted connection on private bus.
> [  600.044209] systemd[1]: Got D-Bus request: 
> org.freedesktop.systemd1.Agent.Released() on 
> /org/freedesktop/systemd1/agent
> [  600.044637] systemd[1]: cpu-ondemand.service: cgroup is empty
> [  600.045025] systemd[1]: Got D-Bus request: 
> org.freedesktop.DBus.Local.Disconnected() on /org/freedesktop/DBus/Local
> root@beaglebone:/lib/systemd/system#
>  CTRL-A Z för hjäl115200 8N1   NOR    | Minicom 2.6.2 VT102 Offline
>
>


--------------070104010402000902040107
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 2013-11-04 01:01, Ulf Samuelsson
      wrote:<br>
    </div>
    <blockquote cite="mid:5276E3E3.7080807@emagii.com" type="cite">Have
      built the Angstrom master for a Beaglebone.
      <br>
      <br>
      Trying to create a simple systemd service (non-forking).
      <br>
      This fails to start.
      <br>
      <br>
      When I look into the systemd log (log_level=debug),
      <br>
      there are references to "/org/freedesktop/systemd1"
      <br>
      which does not exist.
      <br>
      <h4> <a href="http://www.bbc.co.uk/programmes/b03bvnf9"
          about="/programmes/b03bvnf9#programme"> <span class="title"
            property="dc:title">Over the Rainbow</span> </a> </h4>
      <br>
      Instead&nbsp; "/run/systemd" exist, which I believe
      <br>
      is present in newer systemd's.
      <br>
      <br>
      The service uses the boost, curl, curlpp and thread libraries.
      <br>
      Uses UDP and serial port for communication.
      <br>
      <br>
      I do not use D-Bus directly, but it seems to be related to D-Bus
      anyway.
      <br>
      <br>
      Anyone got a clue on how to proceed?
      <br>
    </blockquote>
    Had another look, and I was barking up the wrong tree.<br>
    /usr/share/dbus-1/services contains org.freedesktop.systemd1.service<br>
    <br>
    My app dies when I do <br>
    <br>
    &nbsp;&nbsp;&nbsp;&nbsp; getenv("HOME");<br>
    <br>
    When I define <br>
    User=root<br>
    Group=root<br>
    <br>
    the nodeserver.service it starts without problem.<br>
    <br>
    Sorry to bother.<br>
    <br>
    BR<br>
    Ulf<br>
    <br>
    <blockquote cite="mid:5276E3E3.7080807@emagii.com" type="cite">
      <br>
      BR
      <br>
      Ulf Samuelsson
      <br>
      <br>
      root@beaglebone:/lib/systemd/system# dmesg
      <br>
      [&nbsp; 565.616506] systemd[1]: Accepted connection on private bus.
      <br>
      [&nbsp; 565.625796] systemd[1]: Got D-Bus request:
      org.freedesktop.systemd1.Manager.StartUnit() on
      /org/freedesktop/systemd1
      <br>
      [&nbsp; 565.627071] systemd[1]: Trying to enqueue job
      nodeserver-dbg.service/start/replace
      <br>
      [&nbsp; 565.627719] systemd[1]: Installed new job
      nodeserver-dbg.service/start as 1239
      <br>
      [&nbsp; 565.627784] systemd[1]: Enqueued job
      nodeserver-dbg.service/start as 1239
      <br>
      [&nbsp; 565.628048] systemd[1]: Starting ICU Nodeserver...
      <br>
      [&nbsp; 565.628539] systemd[1]: About to execute /usr/bin/nodeserver
      <br>
      [&nbsp; 565.632042] systemd[1]: Forked /usr/bin/nodeserver as 700
      <br>
      [&nbsp; 565.637804] systemd[1]: nodeserver-dbg.service changed dead
      -&gt; running
      <br>
      [&nbsp; 565.637895] systemd[1]: Job nodeserver-dbg.service/start
      finished, result=done
      <br>
      [&nbsp; 565.637991] systemd[1]: Started ICU Nodeserver.
      <br>
      [&nbsp; 565.643147] systemd[1]: Got D-Bus request:
      org.freedesktop.systemd1.Manager.GetUnit() on
      /org/freedesktop/systemd1
      <br>
      [&nbsp; 565.645611] systemd[1]: Got D-Bus request:
      org.freedesktop.DBus.Properties.Get() on
      /org/freedesktop/systemd1/unit/nodeserver_2ddbg_2ese
      <br>
      [&nbsp; 565.646393] systemd[1]: Got D-Bus request:
      org.freedesktop.DBus.Local.Disconnected() on
      /org/freedesktop/DBus/Local
      <br>
      [&nbsp; 565.695586] systemd[1]: Received SIGCHLD from PID 700
      (nodeserver).
      <br>
      [&nbsp; 565.695940] systemd[1]: Got SIGCHLD for process 700
      (nodeserver)
      <br>
      [&nbsp; 565.696349] systemd[1]: Child 700 died (code=killed,
      status=11/SEGV)
      <br>
      [&nbsp; 565.696377] systemd[1]: Child 700 belongs to
      nodeserver-dbg.service
      <br>
      [&nbsp; 565.696436] systemd[1]: nodeserver-dbg.service: main process
      exited, code=killed, status=11/SEGV
      <br>
      [&nbsp; 565.697576] systemd[1]: nodeserver-dbg.service changed running
      -&gt; failed
      <br>
      [&nbsp; 565.698397] systemd[1]: Unit nodeserver-dbg.service entered
      failed state
      <br>
      [&nbsp; 565.708643] systemd[1]: Accepted connection on private bus.
      <br>
      [&nbsp; 565.712325] systemd[1]: Got D-Bus request:
      org.freedesktop.systemd1.Agent.Released() on
      /org/freedesktop/systemd1/agent
      <br>
      [&nbsp; 565.712736] systemd[1]: nodeserver-dbg.service: cgroup is empty
      <br>
      [&nbsp; 565.713126] systemd[1]: Got D-Bus request:
      org.freedesktop.DBus.Local.Disconnected() on
      /org/freedesktop/DBus/Local
      <br>
      [&nbsp; 573.192670] systemd[1]: Accepted connection on private bus.
      <br>
      [&nbsp; 573.197976] systemd[1]: Got D-Bus request:
      org.freedesktop.DBus.Properties.GetAll() on
      /org/freedesktop/systemd1/unit/nodeserver_2ddbg_e
      <br>
      [&nbsp; 573.199318] systemd[1]: Looking for unit files in:
      <br>
      [&nbsp; 573.199345] systemd[1]:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /etc/systemd/system
      <br>
      [&nbsp; 573.199360] systemd[1]:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /lib/systemd/system
      <br>
      [&nbsp; 573.199898] systemd[1]: Looking for SysV init scripts in:
      <br>
      [&nbsp; 573.199919] systemd[1]:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /etc/init.d
      <br>
      [&nbsp; 573.199939] systemd[1]: Looking for SysV rcN.d links in:
      <br>
      [&nbsp; 573.199954] systemd[1]:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /etc
      <br>
      [&nbsp; 573.213709] systemd[1]: Got D-Bus request:
      org.freedesktop.DBus.Local.Disconnected() on
      /org/freedesktop/DBus/Local
      <br>
      [&nbsp; 600.000471] systemd[1]: Timer elapsed on cpu-ondemand.timer
      <br>
      [&nbsp; 600.000520] systemd[1]: Trying to enqueue job
      cpu-ondemand.service/start/replace
      <br>
      [&nbsp; 600.001038] systemd[1]: Installed new job
      cpu-ondemand.service/start as 1287
      <br>
      [&nbsp; 600.001121] systemd[1]: Enqueued job cpu-ondemand.service/start
      as 1287
      <br>
      [&nbsp; 600.001200] systemd[1]: cpu-ondemand.timer changed waiting
      -&gt; running
      <br>
      [&nbsp; 600.001335] systemd[1]: Starting Switch to ondemand CPU-freq
      governor...
      <br>
      [&nbsp; 600.001729] systemd[1]: About to execute /usr/bin/cpufreq-set
      -g ondemand
      <br>
      [&nbsp; 600.003352] systemd[1]: Forked /usr/bin/cpufreq-set as 704
      <br>
      [&nbsp; 600.006998] systemd[1]: cpu-ondemand.service changed dead -&gt;
      start
      <br>
      [&nbsp; 600.007118] systemd[1]: Running GC...
      <br>
      [&nbsp; 600.026202] systemd[1]: Received SIGCHLD from PID 704
      (cpufreq-set).
      <br>
      [&nbsp; 600.026412] systemd[1]: Got SIGCHLD for process 704
      (cpufreq-set)
      <br>
      [&nbsp; 600.026794] systemd[1]: Child 704 died (code=exited,
      status=0/SUCCESS)
      <br>
      [&nbsp; 600.026848] systemd[1]: Child 704 belongs to
      cpu-ondemand.service
      <br>
      [&nbsp; 600.026907] systemd[1]: cpu-ondemand.service: main process
      exited, code=exited, status=0/SUCCESS
      <br>
      [&nbsp; 600.028323] systemd[1]: cpu-ondemand.service changed start
      -&gt; dead
      <br>
      [&nbsp; 600.028373] systemd[1]: cpu-ondemand.timer got notified about
      unit deactivation.
      <br>
      [&nbsp; 600.028413] systemd[1]: cpu-ondemand.timer: Timer is elapsed.
      <br>
      [&nbsp; 600.028434] systemd[1]: cpu-ondemand.timer changed running
      -&gt; elapsed
      <br>
      [&nbsp; 600.029147] systemd[1]: Job cpu-ondemand.service/start
      finished, result=done
      <br>
      [&nbsp; 600.029246] systemd[1]: Started Switch to ondemand CPU-freq
      governor.
      <br>
      [&nbsp; 600.040413] systemd[1]: Accepted connection on private bus.
      <br>
      [&nbsp; 600.044209] systemd[1]: Got D-Bus request:
      org.freedesktop.systemd1.Agent.Released() on
      /org/freedesktop/systemd1/agent
      <br>
      [&nbsp; 600.044637] systemd[1]: cpu-ondemand.service: cgroup is empty
      <br>
      [&nbsp; 600.045025] systemd[1]: Got D-Bus request:
      org.freedesktop.DBus.Local.Disconnected() on
      /org/freedesktop/DBus/Local
      <br>
      root@beaglebone:/lib/systemd/system#
      <br>
      &nbsp;CTRL-A Z f&ouml;r hj&auml;l115200 8N1&nbsp;&nbsp; NOR&nbsp;&nbsp;&nbsp; | Minicom 2.6.2 VT102
      Offline
      <br>
      <br>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------070104010402000902040107--
