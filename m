Return-Path: <ulf@emagii.com>
Received: from smtp-out21.han.skanova.net (smtp-out21.han.skanova.net
	[195.67.226.208])
	by mail.openembedded.org (Postfix) with ESMTP id D97136D5B4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 00:01:39 +0000 (UTC)
Received: from [10.175.196.165] (83.227.57.102) by smtp-out21.han.skanova.net
	(8.5.133) (authenticated as u82406562)
	id 5253E36C00AD8DC1; Mon, 4 Nov 2013 01:01:39 +0100
Message-ID: <5276E3E3.7080807@emagii.com>
Date: Mon, 04 Nov 2013 01:01:39 +0100
From: Ulf Samuelsson <ulf@emagii.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: angstrom-distro-devel@linuxtogo.org, 
	openembedded-core@lists.openembedded.org
Subject: Mix of systemd version in Angstrom Master
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
X-List-Received-Date: Mon, 04 Nov 2013 00:01:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Have built the Angstrom master for a Beaglebone.

Trying to create a simple systemd service (non-forking).
This fails to start.

When I look into the systemd log (log_level=debug),
there are references to "/org/freedesktop/systemd1"
which does not exist.

Instead  "/run/systemd" exist, which I believe
is present in newer systemd's.

The service uses the boost, curl, curlpp and thread libraries.
Uses UDP and serial port for communication.

I do not use D-Bus directly, but it seems to be related to D-Bus anyway.

Anyone got a clue on how to proceed?

BR
Ulf Samuelsson

root@beaglebone:/lib/systemd/system# dmesg
[  565.616506] systemd[1]: Accepted connection on private bus.
[  565.625796] systemd[1]: Got D-Bus request: 
org.freedesktop.systemd1.Manager.StartUnit() on /org/freedesktop/systemd1
[  565.627071] systemd[1]: Trying to enqueue job 
nodeserver-dbg.service/start/replace
[  565.627719] systemd[1]: Installed new job 
nodeserver-dbg.service/start as 1239
[  565.627784] systemd[1]: Enqueued job nodeserver-dbg.service/start as 1239
[  565.628048] systemd[1]: Starting ICU Nodeserver...
[  565.628539] systemd[1]: About to execute /usr/bin/nodeserver
[  565.632042] systemd[1]: Forked /usr/bin/nodeserver as 700
[  565.637804] systemd[1]: nodeserver-dbg.service changed dead -> running
[  565.637895] systemd[1]: Job nodeserver-dbg.service/start finished, 
result=done
[  565.637991] systemd[1]: Started ICU Nodeserver.
[  565.643147] systemd[1]: Got D-Bus request: 
org.freedesktop.systemd1.Manager.GetUnit() on /org/freedesktop/systemd1
[  565.645611] systemd[1]: Got D-Bus request: 
org.freedesktop.DBus.Properties.Get() on 
/org/freedesktop/systemd1/unit/nodeserver_2ddbg_2ese
[  565.646393] systemd[1]: Got D-Bus request: 
org.freedesktop.DBus.Local.Disconnected() on /org/freedesktop/DBus/Local
[  565.695586] systemd[1]: Received SIGCHLD from PID 700 (nodeserver).
[  565.695940] systemd[1]: Got SIGCHLD for process 700 (nodeserver)
[  565.696349] systemd[1]: Child 700 died (code=killed, status=11/SEGV)
[  565.696377] systemd[1]: Child 700 belongs to nodeserver-dbg.service
[  565.696436] systemd[1]: nodeserver-dbg.service: main process exited, 
code=killed, status=11/SEGV
[  565.697576] systemd[1]: nodeserver-dbg.service changed running -> failed
[  565.698397] systemd[1]: Unit nodeserver-dbg.service entered failed state
[  565.708643] systemd[1]: Accepted connection on private bus.
[  565.712325] systemd[1]: Got D-Bus request: 
org.freedesktop.systemd1.Agent.Released() on /org/freedesktop/systemd1/agent
[  565.712736] systemd[1]: nodeserver-dbg.service: cgroup is empty
[  565.713126] systemd[1]: Got D-Bus request: 
org.freedesktop.DBus.Local.Disconnected() on /org/freedesktop/DBus/Local
[  573.192670] systemd[1]: Accepted connection on private bus.
[  573.197976] systemd[1]: Got D-Bus request: 
org.freedesktop.DBus.Properties.GetAll() on 
/org/freedesktop/systemd1/unit/nodeserver_2ddbg_e
[  573.199318] systemd[1]: Looking for unit files in:
[  573.199345] systemd[1]:      /etc/systemd/system
[  573.199360] systemd[1]:      /lib/systemd/system
[  573.199898] systemd[1]: Looking for SysV init scripts in:
[  573.199919] systemd[1]:      /etc/init.d
[  573.199939] systemd[1]: Looking for SysV rcN.d links in:
[  573.199954] systemd[1]:      /etc
[  573.213709] systemd[1]: Got D-Bus request: 
org.freedesktop.DBus.Local.Disconnected() on /org/freedesktop/DBus/Local
[  600.000471] systemd[1]: Timer elapsed on cpu-ondemand.timer
[  600.000520] systemd[1]: Trying to enqueue job 
cpu-ondemand.service/start/replace
[  600.001038] systemd[1]: Installed new job cpu-ondemand.service/start 
as 1287
[  600.001121] systemd[1]: Enqueued job cpu-ondemand.service/start as 1287
[  600.001200] systemd[1]: cpu-ondemand.timer changed waiting -> running
[  600.001335] systemd[1]: Starting Switch to ondemand CPU-freq governor...
[  600.001729] systemd[1]: About to execute /usr/bin/cpufreq-set -g ondemand
[  600.003352] systemd[1]: Forked /usr/bin/cpufreq-set as 704
[  600.006998] systemd[1]: cpu-ondemand.service changed dead -> start
[  600.007118] systemd[1]: Running GC...
[  600.026202] systemd[1]: Received SIGCHLD from PID 704 (cpufreq-set).
[  600.026412] systemd[1]: Got SIGCHLD for process 704 (cpufreq-set)
[  600.026794] systemd[1]: Child 704 died (code=exited, status=0/SUCCESS)
[  600.026848] systemd[1]: Child 704 belongs to cpu-ondemand.service
[  600.026907] systemd[1]: cpu-ondemand.service: main process exited, 
code=exited, status=0/SUCCESS
[  600.028323] systemd[1]: cpu-ondemand.service changed start -> dead
[  600.028373] systemd[1]: cpu-ondemand.timer got notified about unit 
deactivation.
[  600.028413] systemd[1]: cpu-ondemand.timer: Timer is elapsed.
[  600.028434] systemd[1]: cpu-ondemand.timer changed running -> elapsed
[  600.029147] systemd[1]: Job cpu-ondemand.service/start finished, 
result=done
[  600.029246] systemd[1]: Started Switch to ondemand CPU-freq governor.
[  600.040413] systemd[1]: Accepted connection on private bus.
[  600.044209] systemd[1]: Got D-Bus request: 
org.freedesktop.systemd1.Agent.Released() on /org/freedesktop/systemd1/agent
[  600.044637] systemd[1]: cpu-ondemand.service: cgroup is empty
[  600.045025] systemd[1]: Got D-Bus request: 
org.freedesktop.DBus.Local.Disconnected() on /org/freedesktop/DBus/Local
root@beaglebone:/lib/systemd/system#
  CTRL-A Z för hjäl115200 8N1   NOR    | Minicom 2.6.2 VT102 Offline


-- 
Best Regards
Ulf Samuelsson


