Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 93D3B6010B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jan 2019 07:50:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x027oedk017227
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 1 Jan 2019 23:50:42 -0800 (PST)
Received: from [128.224.163.141] (128.224.163.141) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Tue, 1 Jan 2019 23:50:40 -0800
To: Jonas Bonn <jonas@norrbonn.se>, <openembedded-core@lists.openembedded.org>
References: <20181231120559.25470-1-jonas@norrbonn.se>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <70bb07c3-1898-5a46-c6bf-ae788cfd7181@windriver.com>
Date: Wed, 2 Jan 2019 15:58:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20181231120559.25470-1-jonas@norrbonn.se>
X-Originating-IP: [128.224.163.141]
Subject: Re: [PATCH 0/7] systemd patches
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
X-List-Received-Date: Wed, 02 Jan 2019 07:50:41 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jonas,

I'd like to talk about this patchset from a non-technical view.
And to be brief, my conclusion is suggesting using some switch, e.g. 
DISTRO_FEATURE, to control this 'stateless' behavior.
Please see details below.

This patchset is based on two assumptions:
1) Users would generally want 'stateless' system. Or in other words, 
they would prefer 'stateless' more than 'stateful'.
2) Other softwares/upstreams are also working against this 'stateless' goal.

 From the current situation, both are not that true. As your [PATCH 7/7] 
points out, even systemd defaults to install things under /etc.

Cleaning up systemd's /etc files while leaving other softwares requiring 
/etc files is not that pleasant. At a minimum, systemd users who are not 
aware of this 'stateless' concept would be confused. "Where's my 
/etc/systemd/system.conf file?!" They would ask.
So I'd suggest using something like 'stateless' DISTRO_FEATURE (just 
like 'usrmerge') to control each recipe's behavior.

Best Regards,
Chen Qi

On 12/31/2018 08:05 PM, Jonas Bonn wrote:
> These patches make some modifications to systemd with the long-term goal
> of being able to run OE in systemd's "stateless" configuration.
> "Stateless" boils down to building an image with empty /etc and /var
> directories so that volatile (tmpfs) filesystems can be mounted there;
> this requires that the system subsequently be able to populate these
> directories dynamically, which systemd mostly takes care of if things
> are done right.
>
> In these patches:
> i)    Don't include machine-id in writable images so that systemd can run
> its first-boot machinery
> ii)   Move systemd configuration files out of /etc
> iii)  Allow systemd to dynamically enable services and populate
> /etc/systemd/system via the presets mechanism
>
> There's a long way to go to get to a working "stateless" configuration.
> Getting to a "volatile" system (just empty /var) should be easier and
> I'll post patches moving things in that direction shortly.
>
> /Jonas
>
> Jonas Bonn (7):
>    systemd: do not create machine-id
>    systemd-conf: simplify creation of configuration
>    systemd: move additional conffiles to systemd-conf
>    systemd: create preset files instead of installing in image
>    systemd-systemctl-native: simplify and support preset-all
>    rootfs-postcommands: call preset-all for read-only-rootfs
>    systemd: do not pre-enable services, rely on presets
>
>   meta/classes/rootfs-postcommands.bbclass      |  8 ++++
>   meta/classes/systemd.bbclass                  | 33 +++++++-------
>   meta/recipes-core/systemd/systemd-conf.bb     | 45 +++++++------------
>   .../systemd/systemd-systemctl/systemctl       | 36 +++------------
>   meta/recipes-core/systemd/systemd_239.bb      |  4 ++
>   5 files changed, 52 insertions(+), 74 deletions(-)
>


