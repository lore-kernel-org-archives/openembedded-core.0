Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TxL4O-0002Jl-6s
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 18:22:17 +0100
Received: from mail-pa0-f69.google.com ([209.85.220.69])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 21 Jan 2013 09:04:22 -0800
Received: by mail-pa0-f69.google.com with SMTP id rl6so7427675pac.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 09:05:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:message-id:date:from:user-agent:mime-version
	:to:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=u9it4e0jbgKe2lPE8LiUan3HQz764eoi1n1PKpqGy44=;
	b=ahVl7rsxXpw2RHFolRYw1vABnGAfMCgzrWBrnRIeS8uvDA2zsBO25usd7NKo3gBNJE
	Qr4waER04pgMdhB+V/t3eSRZ2xSr1hcjGqVeJgfK4rVRDcqmxprEEZ0YXVz4tMjCjY6F
	qPIaCxLrycDOnZqAGtOMKI99qVAYHmPQDJhtqwA0hLQEToh2SQhzQhyhLWot6y5hr4DV
	RlXC09k0l82+EHoGBpNw0NrEhbNeliqEhLdnFLsg5/Y8Ys7+Xd8/HO2WdI6zev7RScg8
	kr+s5JApj1bK/ZuNaQD8ebbBcGmuxRm8LAXeXspz89Yvd9laHLA6wxoAp5DHTJoXV2VR
	6qug==
X-Received: by 10.68.236.2 with SMTP id uq2mr31116720pbc.55.1358787926219;
	Mon, 21 Jan 2013 09:05:26 -0800 (PST)
X-Received: by 10.68.236.2 with SMTP id uq2mr31116691pbc.55.1358787926049;
	Mon, 21 Jan 2013 09:05:26 -0800 (PST)
Received: from [192.168.1.201] ([70.96.45.215])
	by mx.google.com with ESMTPS id vq4sm8980269pbc.67.2013.01.21.09.05.24
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 21 Jan 2013 09:05:25 -0800 (PST)
Message-ID: <50FD7553.50602@intel.com>
Date: Mon, 21 Jan 2013 09:05:23 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <50FD5CDC.6080604@communistcode.co.uk>
In-Reply-To: <50FD5CDC.6080604@communistcode.co.uk>
X-Gm-Message-State: ALoCoQlh/EC5tgumBO1CMMlcrcrBgZJUeTNgTHixfg5vaJ8sEtqzbDrR7o+nSy/ZKlSc7mPBX3ce3ebZcsBm+q8KyaT5088HAxDOXmS/000Z//uEU/Ggt53ZafMmT/pyJ04tR+G3WUjwdmJMktVKzrQnIfuDeVGxU8rOT0vpL5ZFcz2scNLSSU/74YKg9qyIyXVpH6PUFkHP
Subject: Re: SSH Login Delay
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
X-List-Received-Date: Mon, 21 Jan 2013 17:22:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/21/2013 07:21 AM, Jack Mitchell wrote:
> I have recently noticed that when SSH'ing to my BeagleBone it has a 3-5
> second delay before the bash prompt shows. I have looked in
> /var/log/messages and noticed:
>
> Jan 18 15:47:12 beaglebone auth.info sshd[12389]: Accepted none for root
> from 192.168.0.51 port 37905 ssh2
> Jan 18 15:47:12 beaglebone auth.info sshd[12399]: lastlog_openseek:
> Couldn't stat /var/log/lastlog: No such file or directory
> Jan 18 15:47:12 beaglebone auth.info sshd[12399]: lastlog_openseek:
> Couldn't stat /var/log/lastlog: No such file or directory
>
> I was wondering if these stat commands had a timeout on them and
> therefore causing the delay. If so, why do these logs not exist?
>
> I have also noticed that avahi has crept into my image recently and if
> it was possibly something to do with dns resolution or similar?

In my experience this is most likely due to DNS resolution timing out 
trying to resolve a LAN IP address.

Try editing the sshd_config on your BeagleBone's filesystem and set 
UseDNS to no. See if that helps.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


