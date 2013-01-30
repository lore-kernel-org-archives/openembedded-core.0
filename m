Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1U0UuG-0003GE-PC
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 11:28:42 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r0UACv9O015565
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 30 Jan 2013 11:12:58 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1U0UfK-0006rk-EC; Wed, 30 Jan 2013 11:13:14 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1359500666-2874-1-git-send-email-sgw@linux.intel.com>
Date: Wed, 30 Jan 2013 11:13:14 +0100
In-Reply-To: <1359500666-2874-1-git-send-email-sgw@linux.intel.com> (Saul
	Wold's message of "Tue, 29 Jan 2013 15:04:26 -0800")
Message-ID: <lytxpzkmh1.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.83
X-Spam-Score: -5.6
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Saul Wold <sgw-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH] rootfs_rpm: Escape the backtick to ensure the ls runs on the target
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
X-List-Received-Date: Wed, 30 Jan 2013 10:28:42 -0000
Content-Type: text/plain

Saul Wold <sgw-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> writes:

> This change ensures that the ls /etc/rpm-postinsts runs in the target
> at first boot time, rather than at the creation time of the script on
> the host.
> ...
> -for i in `ls /etc/rpm-postinsts/`; do
> +for i in \`ls /etc/rpm-postinsts/\`; do
>  	i=/etc/rpm-postinsts/$i
>  	echo "Running postinst $i..."

are you really sure, this is enough? $i gets probably expanded too.  A
better way than to escape all and everything is to quote the EOF marker.

E.g. compare

i=abc

cat << "EOF"
echo $i
EOF

cat << EOF
echo $i
EOF


Enrico


